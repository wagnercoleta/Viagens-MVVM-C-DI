//
//  BaseViewModel.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

class BaseViewModel: BaseViewModelProtocol {
    
    weak var delegateCoordinator: AppCoordinatorProtocol?
}
