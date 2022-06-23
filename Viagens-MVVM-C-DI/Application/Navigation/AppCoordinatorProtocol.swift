//
//  AppCoordinatorProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    
    var parentCoordinator: AppCoordinatorProtocol? { get set }
    var children: [AppCoordinatorProtocol] {  get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
