//
//  ViagemServiceProtocol.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

protocol ViagemServiceProtocol {
    func fetchViagens(completion: @escaping ([ViagemDTO]?, Error?) -> Void)
    func getData(url: String, completion: @escaping (Data?)-> Void)
}
