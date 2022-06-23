//
//  ViagemViewModelTests.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 23/06/22.
//

import XCTest
@testable import Viagens_MVVM_C_DI

final class ListViagemViewModelTests: XCTestCase {
    
    func test_loadViagens_with_error() {
        let (sut, httpClient, service) = makeSut()
        let exp = expectation(description: "waiting")
        var errorTemp: Error?
        service.fetchViagens { viagensDTO, error in
            errorTemp = error
            exp.fulfill()
        }
        httpClient.completeWithError(.invalidURL)
        sut.loadViagens()
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(errorTemp)
    }
    
    func test_loadViagens_with_data_valid() {
        let (sut, httpClient, service) = makeSut()
        let data = makeViagensData()
        UrlProtocolStub.simulate(data: data, response: makeHttpResponse(), error: nil)
        let exp = expectation(description: "waiting")
        var viagensVM: [Viagem]?
        service.fetchViagens { viagensDTO, error in
            if let lstDTO = viagensDTO {
                viagensVM = sut.getListViagens(viagensDTO: lstDTO)
            }
            exp.fulfill()
        }
        httpClient.completeWithData(data!)
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(viagensVM)
        XCTAssertEqual(1, viagensVM?.count)
        
    }
}

extension ListViagemViewModelTests {
    func makeSut() -> (sut: ListViagemViewModel, httpClient: LibHttpClientProtocolMock, service: ViagemService) {
        let httpClient = LibHttpClientProtocolMock()
        let networkManager = LibNetworkManager(httpClient: httpClient)
        let service = ViagemService(networkManager: networkManager)
        let sut = ListViagemViewModel(viagemService: service)
        return (sut, httpClient, service)
    }
}

