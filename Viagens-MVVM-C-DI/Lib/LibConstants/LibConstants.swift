//
//  LibConstants.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

struct LibConstants {
    static let libTitleOk = NSLocalizedString("Ok", comment: "")
    static let libTitleError = NSLocalizedString("Ops, ocorreu um erro", comment: "")
    
    static let libHttpErrorNoConnectivity = NSLocalizedString("Sem conexão", comment: "")
    static let libHttpErrorInvalidURL = NSLocalizedString("URL inválida", comment: "")
    static let libHttpErrorRequest = NSLocalizedString("Erro de requisição", comment: "")
    static let libHttpErrorNoData = NSLocalizedString("Nenhum dado retornado", comment: "")
    static let libHttpErrorErrorWithDecodable = NSLocalizedString("Erro na decodificação do objeto (Decodable)", comment: "")
}
