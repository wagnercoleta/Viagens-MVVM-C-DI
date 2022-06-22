//
//  LibAlamofireAdapterTests.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import XCTest
import Alamofire
@testable import Viagens_MVVM_C_DI

final class LibAlamofireAdapterTests: XCTestCase {
    func test_url_invalida() {
        let sut = makeSut()
        let exp = expectation(description: "waiting")
        sut.get(to: "") { result in
            switch result {
                case .failure(let httpError): XCTAssertEqual(httpError, .invalidURL)
                default: XCTFail("Expected failure!")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    
    func test_response_nula() {
        let sut = makeSut()
        UrlProtocolStub.simulate(data: makeViagemData(), response: nil, error: nil)
        let exp = expectation(description: "waiting")
        sut.get(to: makeUrlString()) { result in
            switch result {
                case .failure(let httpError): XCTAssertEqual(httpError, .noConnectivity)
                default: XCTFail("Expected failure!")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    
    func test_response_sucesso() {
        let sut = makeSut()
        let data = makeViagemData()
        UrlProtocolStub.simulate(data: data, response: makeHttpResponse(), error: nil)
        let exp = expectation(description: "waiting")
        sut.get(to: makeUrlString()) { result in
            switch result {
                case .success(let dataReceived): XCTAssertEqual(data, dataReceived)
                default: XCTFail("Expected failure!")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    
    func test_response_error_statuscode_300() {
        let sut = makeSut()
        let data = makeViagemData()
        UrlProtocolStub.simulate(data: data, response: makeHttpResponse(statusCode: 300), error: nil)
        let exp = expectation(description: "waiting")
        sut.get(to: makeUrlString()) { result in
            switch result {
                case .failure(let httpError): XCTAssertEqual(httpError, .request)
                default: XCTFail("Expected failure!")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

extension LibAlamofireAdapterTests {
    func makeSut() -> LibAlamofireAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = LibAlamofireAdapter(session: session)
        return sut
    }
}
