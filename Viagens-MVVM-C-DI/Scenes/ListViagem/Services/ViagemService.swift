//
//  ViagemService.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

final class ViagemService {
    
    private let networkManager: LibNetworkManagerProtocol
    private let baseURL = "https://run.mocky.io/v3/"
    private let endpoint = "a8a0220d-d6f2-4679-9db0-d3261efdcb5f"
    private var url: String {
        get {
            return self.baseURL + self.endpoint
        }
    }
    
    init(networkManager: LibNetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension ViagemService: ViagemServiceProtocol {
    func fetchViagens(completion: @escaping ([ViagemDTO]?, Error?) -> Void) {
        networkManager.fetch(url: self.url, completion: completion)
    }
    
    func getData(url: String, completion: @escaping (Data?)-> Void) {
        networkManager.getData(url: url, completion: completion)
    }
}
