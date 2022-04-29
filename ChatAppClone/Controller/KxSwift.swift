//
//  KxSwift.swift
//  ChatAppClone
//
//  Created by Tuan on 22/04/2022.
//

import Foundation

class KxSwift<T> {
    
    typealias Observer = (T) -> ()
    var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func bind(_ listner: Observer?) {
        self.observer = listner
    }
    
    func subscribe(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
    
}
