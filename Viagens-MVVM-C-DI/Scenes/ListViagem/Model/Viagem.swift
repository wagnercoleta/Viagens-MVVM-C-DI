//
//  Viagem.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation
import UIKit

class Viagem {
    let id: Int
    let title: String
    let description: String
    let urlImage: String
    let type: TypeViagemEnum
    let price: Decimal
    let discountPrice: Decimal
    let numberOfSplit: Int
    let priceFinal: Decimal
    let priceNumberOfSplit: Decimal
    var Image: UIImage?
    
    init(id: Int, title: String, description: String, urlImage: String, type: TypeViagemEnum, price: Decimal,
         discountPrice: Decimal, numberOfSplit: Int, priceFinal: Decimal, priceNumberOfSplit: Decimal) {
        self.id = id
        self.title = title
        self.description = description
        self.urlImage = urlImage
        self.type = type
        self.price = price
        self.discountPrice = discountPrice
        self.numberOfSplit = numberOfSplit
        self.priceFinal = priceFinal
        self.priceNumberOfSplit = priceNumberOfSplit
    }
}
