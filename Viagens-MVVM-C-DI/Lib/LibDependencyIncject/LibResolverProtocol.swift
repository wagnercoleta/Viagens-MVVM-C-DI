//
//  LibResolverProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

protocol LibResolverProtocol {
    func resolver<T>(_ metaType: T.Type) -> T
    func autoResolve<T>() -> T
}
