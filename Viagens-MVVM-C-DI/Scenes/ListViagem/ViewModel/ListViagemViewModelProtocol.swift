//
//  ListViagemViewModelProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

protocol ListViagemViewModelProtocol: BaseViewModelProtocol {
    var delegateAlertView: LibAlertViewProtocol? { get set }
    var viagens: LibObservable<[Viagem]> { get }
    func loadViagens()
}
