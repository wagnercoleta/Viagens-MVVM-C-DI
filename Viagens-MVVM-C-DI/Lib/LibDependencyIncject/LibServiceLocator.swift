//
//  LibServiceLocator.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 22/06/22.
//

import Foundation

final class LibServiceLocator {
    static let shared: LibServiceLocatorProtocol = LibServiceLocator()
    
    private final class LazyInstanceWrapper {
        let instance: Any
        init(instance: Any) {
            self.instance = instance
        }
    }
    
    private var instances: [String: Any] = [:]
    private var lazyInstances: NSMapTable<NSString, LazyInstanceWrapper> = .init(
        keyOptions: .strongMemory,
        valueOptions: .weakMemory
    )
    
    private typealias LazyDependencyFactory = () -> Any
    private var factories: [String: LazyDependencyFactory] = [:]
    
    private func getKey<T>(for metaType: T.Type) -> String {
        let key = String(describing: T.self)
        return key
    }
}

extension LibServiceLocator {
    private func getInstance<T>(formMetaType: T.Type) -> T? {
        let key = getKey(for: T.self)
        if let instance = instances[key] as? T {
            return instance
        } else if let lazyInstance = getLazyInstance(for: T.self, key: key) {
            return lazyInstance
        } else {
            return nil
        }
    }
    
    private func getLazyInstance<T>(for _: T.Type, key: String) -> T? {
        let objectKey = key as NSString
        
        if let instanceInMemory = lazyInstances.object(forKey: objectKey)?.instance as? T {
            return instanceInMemory
        }
        
        guard
            let factory: LazyDependencyFactory = factories[key],
            let newInstance = factory() as? T
        else { return nil }
        
        let wrappedInstance = LazyInstanceWrapper(instance: newInstance)
        lazyInstances.setObject(wrappedInstance, forKey: objectKey)
        
        return newInstance
    }
}

extension LibServiceLocator: LibConteinerProtocol {
    func register<T>(instance: T, forMetaType metaType: T.Type) {
        let key = getKey(for: metaType)
        guard instances[key] == nil else {
            fatalError("[register] \(LibConstants.mesmaInstanciaError) (\(key))")
        }
        instances[key] = instance
    }
    
    func register<T>(factory: @escaping (LibResolverProtocol) -> T, forMetaType metaType: T.Type) {
        let key = getKey(for: metaType)
        guard factories[key] == nil else {
            fatalError("[register factory] \(LibConstants.mesmaInstanciaError) (\(key))")
        }
        factories[key] = { factory(self) }
    }
}

extension LibServiceLocator: LibResolverProtocol {
    func resolver<T>(_ metaType: T.Type) -> T {
        guard let instance = getInstance(formMetaType: T.self) else {
            fatalError("[resolver] \(LibConstants.naoExisteInstanciaError) `\(getKey(for: T.self))`")
        }
        return instance
    }
    
    func autoResolve<T>() -> T {
        guard let instance = getInstance(formMetaType: T.self) else {
            fatalError("[autoResolve] \(LibConstants.naoExisteInstanciaError) `\(getKey(for: T.self))`")
        }
        return instance
    }
}
