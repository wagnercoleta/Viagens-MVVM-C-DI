//
//  BaseViewModelProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

protocol BaseViewModelProtocol {
    var delegateCoordinator: AppCoordinatorProtocol? { get set }
}
