//
//  LibNetworkManagerIdTitleFake.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation
@testable import Viagens_MVVM_C_DI

final class LibNetworkManagerIdTitleFake {
    private let url = makeUrlString()
    private let networkManager: LibNetworkManagerProtocol
    
    init(networkManager: LibNetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchModelFake(completion: @escaping ([ModelIdTitleFake]?, Error?) -> Void) {
        networkManager.fetch(url: self.url, completion: completion)
    }
}
