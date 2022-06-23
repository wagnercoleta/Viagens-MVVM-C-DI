//
//  TypeViagemEnum.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

enum TypeViagemEnum : String {
    case N
    case I
    
    var text: String {
        switch self {
            case .N:
                return Localizable.SNacional
            case .I:
                return Localizable.SInternacional
        }
    }
}
