//
//  LibAlamofireAdapter.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation
import Alamofire

final class LibAlamofireAdapter {
    private let session: Session
    
    init(session: Session = .default, contentType: String = "application/json") {
        self.session = session
        self.session.sessionConfiguration.allowsCellularAccess = true
        self.session.sessionConfiguration.httpAdditionalHeaders = ["Content-Type": contentType]
        self.session.sessionConfiguration.timeoutIntervalForRequest = 30.0
    }
}

extension LibAlamofireAdapter: LibHttpClientGetProtocol {
    func get(to urlString: String, completion: @escaping (Result<Data?, LibHttpError>) -> Void) {
        guard let _ = URL(string: urlString) else {
            return completion(.failure(.invalidURL))
        }
        session.request(urlString, method: .get).responseData { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else {
                return completion(.failure(.noConnectivity))
            }
            switch dataResponse.result {
                case .failure: completion(.failure(.noConnectivity))
                case .success(let data):
                    switch statusCode {
                        case 200...299:
                            completion(.success(data))
                        default:
                            completion(.failure(.request))
                    }
            }
        }
    }
}
