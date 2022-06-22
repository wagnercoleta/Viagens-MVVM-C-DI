//
//  LibConteinerProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

protocol LibConteinerProtocol {
    func register<T>(instance: T, forMetaType metaType: T.Type)
    func register<T>(
        factory: @escaping (LibResolverProtocol) -> T,
        forMetaType metaType: T.Type
    )
}

extension LibConteinerProtocol {
    func register<T>(
        factory: @escaping () -> T,
        forMetaType metaType: T.Type
        ) {
        self.register(
            factory: { _ in factory() },
            forMetaType: metaType)
    }
}
