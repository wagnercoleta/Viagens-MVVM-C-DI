//
//  ViagemViewModelProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

protocol ViagemViewModelProtocol: BaseViewModelProtocol {
    var viagem: Viagem? { get set }
}
