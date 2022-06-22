//
//  ServiceFake.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

final class ServiceFake {
    private let urlSession: URLSession
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

extension ServiceFake: ServiceFakeProtocol {
    
}
