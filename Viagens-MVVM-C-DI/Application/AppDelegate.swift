//
//  AppDelegate.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import UIKit
import WMCLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.registerDependency()
        return true
    }

    private func registerDependency() {
        let serviceLocator: WMCServiceLocatorProtocol = WMCServiceLocator.shared
        
        //--------- HttpClient ---------------------------------------------------
        serviceLocator.register(instance: LibAlamofireAdapter.init(),
                                forMetaType: LibHttpClientProtocol.self)
        
        //--------- Coordinator --------------------------------------------------
        serviceLocator.register(instance: AppCoordinator(navigationController: UINavigationController.init()),
                                forMetaType: AppCoordinatorProtocol.self)
        
        //--------- NetworkManager -----------------------------------------------
        serviceLocator.register(
            factory: { resolver in
                let httpClient: LibHttpClientProtocol = resolver.autoResolve()
                return LibNetworkManager(httpClient: httpClient)
            },
            forMetaType: LibNetworkManagerProtocol.self
        )
        
        //--------- Services -----------------------------------------------------
        serviceLocator.register(
            factory: { resolver in
                let libNetworkManager: LibNetworkManagerProtocol = resolver.autoResolve()
                return ViagemService(networkManager: libNetworkManager)
            },
            forMetaType: ViagemServiceProtocol.self
        )
        
        //--------- View Model ---------------------------------------------------
        serviceLocator.register(
            factory: { resolver in
                let coordinator: AppCoordinatorProtocol = resolver.autoResolve()
                let viagemService: ViagemServiceProtocol = resolver.autoResolve()
                let viewModel = ListViagemViewModel(viagemService: viagemService)
                viewModel.delegateCoordinator = coordinator
                return viewModel
            },
            forMetaType: ListViagemViewModelProtocol.self
        )
        serviceLocator.register(instance: ViagemViewModel.init(),
                                forMetaType: ViagemViewModelProtocol.self)
        
        //--------- View Controller ----------------------------------------------
        serviceLocator.register(
            factory: { resolver in
                let viewModel: ListViagemViewModelProtocol = resolver.autoResolve()
                return ListViagemViewController(viewModel: viewModel)
            },
            forMetaType: ListViagemViewControllerProtocol.self
        )
        serviceLocator.register(
            factory: { resolver in
                let viewModel: ViagemViewModelProtocol = resolver.autoResolve()
                return ViagemViewController(viewModel: viewModel)
            },
            forMetaType: ViagemViewControllerProtocol.self
        )
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

