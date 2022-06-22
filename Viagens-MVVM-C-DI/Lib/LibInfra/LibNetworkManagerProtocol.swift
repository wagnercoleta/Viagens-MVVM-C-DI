//
//  LibNetworkManagerProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

protocol LibNetworkManagerProtocol {
    func getData(url: String, completion: @escaping (Data?)-> Void)
    func fetch<T: Decodable>(url: String, completion: @escaping ([T]?, Error?) -> Void)
}
