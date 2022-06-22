//
//  LibNetworkManagerTests.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import XCTest
import Alamofire
@testable import Viagens_MVVM_C_DI

final class LibNetworkManagerTests: XCTestCase {
    func test_fetch_no_data() {
        let (sut, httpClient) = makeSut()
        var errorTemp: LibHttpError?
        let exp = expectation(description: "waiting")
        sut.fetchModelFake { modelIdTitleFakeArray, error in
            errorTemp = error as? LibHttpError
            exp.fulfill()
        }
        httpClient.completeWithError(.noData)
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(errorTemp)
    }
    
    func test_fetch_data_valid() {
        let (sut, httpClient) = makeSut()
        let data = makeModelIdTitleData()
        var dataIdTitles = [ModelIdTitleFake]()
        let exp = expectation(description: "waiting")
        sut.fetchModelFake { modelIdTitleFakeArray, error in
            if let lst = modelIdTitleFakeArray {
                dataIdTitles = lst
            }
            exp.fulfill()
        }
        httpClient.completeWithData(data!)
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(1, dataIdTitles.count)
        XCTAssertEqual(1, dataIdTitles[0].id)
    }
}

extension LibNetworkManagerTests {
    func makeSut() -> (sut: LibNetworkManagerIdTitleFake, httpClient: LibHttpClientProtocolMock) {
        let httpClient = LibHttpClientProtocolMock()
        let networkManager = LibNetworkManager(httpClient: httpClient)
        let sut = LibNetworkManagerIdTitleFake(networkManager: networkManager)
        return (sut, httpClient)
    }
}

