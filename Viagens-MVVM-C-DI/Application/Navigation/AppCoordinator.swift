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
    
    func goToViagem(_ viagem: Viagem) {
        var viewModel: ViagemViewModelProtocol = LibServiceLocator.shared.resolver(ViagemViewModelProtocol.self)
        viewModel.viagem = viagem
        viewModel.delegateCoordinator = self
        let vc = ViagemViewController(viewModel: viewModel)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
