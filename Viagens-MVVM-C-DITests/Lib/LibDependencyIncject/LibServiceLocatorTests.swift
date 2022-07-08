//
//  Viagens_MVVM_C_DITests.swift
//  Viagens-MVVM-C-DITests
//
//  Created by Wagner Coleta on 22/06/22.
//

import XCTest
import WMCLib
@testable import Viagens_MVVM_C_DI

class LibServiceLocatorTests: XCTestCase {

    func test_register_resolver_success() {
        let sut = makeSut()
        
        sut.register(
            instance: ViewModelFake.init(),
            forMetaType: ViewModelFakeProtocol.self
        )
        
        let viewModelFake: ViewModelFakeProtocol = sut.resolver(ViewModelFakeProtocol.self)
        XCTAssertNotNil(viewModelFake)
    }
    
    func test_factory_register_resolver_success() {
        let sut = makeSut()
        
        sut.register(instance: URLSession.shared, forMetaType: URLSession.self)
        sut.register(
            factory: { resolver in
                let session: URLSession = resolver.autoResolve()
                return ServiceFake(urlSession: session)
            },
            forMetaType: ServiceFakeProtocol.self
        )
        
        let serviceFake: ServiceFakeProtocol = sut.autoResolve()
        XCTAssertNotNil(serviceFake)
    }
}

extension LibServiceLocatorTests {
    func makeSut() -> WMCServiceLocatorProtocol {
        let serviceLocator: WMCServiceLocatorProtocol = WMCServiceLocator.shared
        return serviceLocator
    }
}
