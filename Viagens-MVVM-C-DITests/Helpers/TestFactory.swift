//
//  TestFactory.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

func makeUrlString() -> String {
    return "http://any-url.com"
}

func makeUrl() -> URL {
    return URL(string: makeUrlString())!
}

func makeDataInvalid() -> Data {
    return Data("invalid_data_json".utf8)
}

func makeViagemJSON() -> String {
    return """
      {
        "id": 1,
        "title": "Natal",
        "description": "Aéreo + Hotel com café",
        "urlImage": "https://i.ibb.co/RbDx7TN/natal-brasil.jpg",
        "type": "N",
        "price": 1284,
        "discountPrice": 300,
        "numberOfSplit": 5
      }
      """
}

func makeViagemData() -> Data? {
    return """
      \(makeViagemJSON())
      """.data(using: .utf8)
}

func makeViagensData() -> Data? {
    return """
      [
      \(makeViagemJSON())
      ]
      """.data(using: .utf8)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeUrl(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}

func makeModelIdTitleData() -> Data? {
    return """
        [{
            "id": 1,
            "title": "TITLE FAKE"
        }]
        """.data(using: .utf8)
}

func mockDataInvalidViagemService() -> Data? {
    return "json-invalid".data(using: .utf8)
}
