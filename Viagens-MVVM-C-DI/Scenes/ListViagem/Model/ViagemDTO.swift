//
//  ViagemDTO.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

struct ViagemDTO: Decodable {
    let id: Int
    let title: String
    let description: String
    let urlImage: String
    let type: String
    let price: Decimal
    let discountPrice: Decimal
    let numberOfSplit: Int
}
