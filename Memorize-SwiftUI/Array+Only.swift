//
//  Array+Only.swift
//  Memorize-SwiftUI
//
//  Created by Laurent B on 26/05/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
