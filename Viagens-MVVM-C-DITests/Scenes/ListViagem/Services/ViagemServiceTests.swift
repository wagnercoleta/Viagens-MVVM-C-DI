//
//  ViagemServiceTests.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 23/06/22.
//

import XCTest
@testable import Viagens_MVVM_C_DI

final class ViagemServiceTests: XCTestCase {
    
    func test_fetchViagens_with_invalid_URL() {
        let url = ""
        let (sut, httpClient) = makeSut(url: url)
        let exp = expectation(description: "waiting")
        var errotTemp: Error?
        sut.fetchViagens { viagens, error in
            errotTemp = error
            exp.fulfill()
        }
        httpClient.completeWithError(.invalidURL)
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(errotTemp)
    }
    
    func test_fetchViagens_with_data_invalid() {
        let url = makeUrlString()
        let (sut, httpClient) = makeSut(url: url)
        let exp = expectation(description: "waiting")
        var errorTemp: Error?
        sut.fetchViagens { viagensDTO, error in
            errorTemp = error
            exp.fulfill()
        }
        httpClient.completeWithData(mockDataInvalidViagemService()!)
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(errorTemp)
    }
    
    func test_fetchViagens_with_data_valid() {
        let url = makeUrlString()
        let (sut, httpClient) = makeSut(url: url)
        let exp = expectation(description: "waiting")
        var dataViagens = [ViagemDTO]()
        sut.fetchViagens { viagensDTO, error in
            if let lst = viagensDTO {
                dataViagens = lst
            }
            exp.fulfill()
        }
        httpClient.completeWithData(makeViagensData()!)
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(1, dataViagens.count)
    }
}

extension ViagemServiceTests {
    func makeSut(url: String) -> (sut: ViagemService, httpClient: LibHttpClientProtocolMock) {
        let httpClient = LibHttpClientProtocolMock()
        let networkManager = LibNetworkManager(httpClient: httpClient)
        let sut = ViagemService(networkManager: networkManager)
        return (sut, httpClient)
    }
}
