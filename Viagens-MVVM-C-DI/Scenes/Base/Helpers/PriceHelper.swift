//
//  PriceHelper.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

func formattedValue(of value: Decimal, hideCurrencySymbol: Bool = false) -> String {
    let brLocale = Locale(identifier: "pt-BR")
    let numberFormatter = NumberFormatter()
    numberFormatter.usesGroupingSeparator = brLocale.groupingSeparator != nil
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = brLocale
    let result = numberFormatter.string(from: value as NSNumber)!
    return result
}

func getPriceLabelAttributedText(_ viagem: Viagem) -> NSAttributedString {
    let priceFinalStr: String = formattedValue(of: viagem.priceFinal)
    let attributedText = NSMutableAttributedString(string: priceFinalStr, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.systemGreen])
    
    let priceStr = formattedValue(of: viagem.price)
    let discoutPriceStr = formattedValue(of: viagem.discountPrice)
    let descriptionPriceStr = "\(priceStr) - \(discoutPriceStr)"
    attributedText.append(NSAttributedString(string: " \(CustomTextLabel.comDesconto) (\(descriptionPriceStr))", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
    
    return attributedText
}
