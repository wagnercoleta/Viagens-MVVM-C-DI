//
//  AppCoordinator.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    
    var parentCoordinator: AppCoordinatorProtocol?
    var children: [AppCoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToListViagem()
    }
    
    func goToListViagem() {
        let vc: ListViagemViewControllerProtocol = LibServiceLocator.shared.resolver(ListViagemViewControllerProtocol.self)        
        self.navigationController.pushViewController(vc as! UIViewController, animated: true)
    }
}
