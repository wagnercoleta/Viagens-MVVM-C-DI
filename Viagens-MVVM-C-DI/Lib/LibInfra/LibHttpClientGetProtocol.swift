//
//  LibHttpClientGetProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

protocol LibHttpClientGetProtocol {
    func get(to urlString: String, completion: @escaping (Result<Data?, LibHttpError>) -> Void)
}
