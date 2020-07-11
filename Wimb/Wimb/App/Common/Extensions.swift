//
//  Extensions.swift
//  Wimb
//
//  Created by Tantia, Himanshu on 11/7/20.
//  Copyright © 2020 Himanshu Tantia. All rights reserved.
//

import Foundation

extension Optional {
    func or(_ other: Optional) -> Optional {
        switch self {
        case .none:
            return other
        case .some:
            return self
        }
    }
    
    func resolve(with error: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .none:
            throw error()
        case .some(let wrapped):
            return wrapped
        }
    }
}

extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("$ERROR: Invalid static string, \n $VALUE: \(string)")
        }
        self = url
    }
}

