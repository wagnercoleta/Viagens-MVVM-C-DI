//
//  Constants.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

struct Localizable {
    static let SNacional = NSLocalizedString("Nacional", comment: "")
    static let SInternacional = NSLocalizedString("Internacional", comment: "")
    
    static let SHeaderNavListViagem = NSLocalizedString("Viagens - Nacionais & Internacionais", comment: "")
}

struct CustomColor {
    static let primary = UIColor(hex: "#3AB0FF")
    static let secundary = UIColor(hex: "#F9F2ED")
    static let appText: UIColor = .darkGray
}

struct CustomTextLabel {
    static let parceladoEmXVezes = NSLocalizedString("em até", comment: "")
    static let comDesconto = NSLocalizedString("com desconto", comment: "")
}
