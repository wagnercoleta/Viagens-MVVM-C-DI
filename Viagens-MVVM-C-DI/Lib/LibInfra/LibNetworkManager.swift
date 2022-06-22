//
//  LibNetworkManager.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

final class LibNetworkManager {
    private let _httpClient: LibHttpClientProtocol
    
    init(httpClient: LibHttpClientProtocol) {
        self._httpClient = httpClient
    }
    
    private func getDataInternal(url: String, completion: @escaping (Data?) -> Void) {
        _httpClient.get(to: url) { result in
            var dataResult: Data?

            switch result {
                case .success(let data):
                    dataResult = data
                case .failure(_):
                    dataResult = nil
            }

            completion(dataResult)
        }
    }
    
    private func callFetch<T: Decodable>(to urlString: String, completion: @escaping ([T]?, LibHttpError?) -> Void) {
        _httpClient.get(to: urlString) { result in
            switch result {
                case .success(let data):
                    do {
                        guard let jsonData = data else {
                            completion(nil, .noData)
                            return
                        }
                        
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode([T].self, from: jsonData)
                        completion(decoded, nil)
                    } catch {
                        completion(nil, .errorWithDecodable)
                    }
                case .failure(let httpError):
                    completion(nil, httpError)
            }
        }
    }
}

extension LibNetworkManager: LibNetworkManagerProtocol {
    
    func getData(url: String, completion: @escaping (Data?)-> Void) {
        getDataInternal(url: url, completion: completion)
    }
    
    func fetch<T>(url: String, completion: @escaping ([T]?, Error?) -> Void) where T : Decodable {
        callFetch(to: url, completion: completion)
    }
}
