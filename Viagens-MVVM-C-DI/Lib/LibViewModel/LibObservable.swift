//
//  LibObservable.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation

final class LibObservable<T> {
    private var listeners: [((T?) -> Void)] = []
    
    var value: T? {
        didSet {
            listeners.forEach { listener in
                listener(value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listeners.append(listener)
    }
}
