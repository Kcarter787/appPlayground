//
//  Logger.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

import Foundation

struct Logger {
    static func examine(object: Any, withLabel: String?) {
        let label = withLabel ?? "Object"
        print("\n\n \(label): \(object)\n\n")
    }
    
}
    
