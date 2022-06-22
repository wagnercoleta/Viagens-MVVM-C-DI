//
//  LibHttpError.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

enum LibHttpError: Error {
    case noConnectivity
    case invalidURL
    case request
    case noData
    case errorWithDecodable
    
    var text: String {
        switch self {
        case .noConnectivity:
            return LibConstants.libHttpErrorNoConnectivity
        case .invalidURL:
            return LibConstants.libHttpErrorInvalidURL
        case .request:
            return LibConstants.libHttpErrorRequest
        case .noData:
            return LibConstants.libHttpErrorNoData
        case .errorWithDecodable:
            return LibConstants.libHttpErrorErrorWithDecodable
        }
    }
}
