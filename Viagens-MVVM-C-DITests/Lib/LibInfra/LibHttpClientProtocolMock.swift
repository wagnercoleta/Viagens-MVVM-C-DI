//
//  LibHttpClientProtocolMock.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation
@testable import Viagens_MVVM_C_DI

final class LibHttpClientProtocolMock: LibHttpClientProtocol {
    
    var urls = [String]()
    var completion: ((Result<Data?, LibHttpError>) -> Void)?
    
    func get(to urlString: String, completion: @escaping (Result<Data?, LibHttpError>) -> Void) {
        self.urls.append(urlString)
        self.completion = completion
    }
    
    func completeWithError(_ error: LibHttpError){
        self.completion?(.failure(error))
    }
    
    func completeWithData(_ data: Data){
        self.completion?(.success(data))
    }
}

