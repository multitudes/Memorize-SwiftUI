//
//  Array+Identifiable.swift
//  Memorize-SwiftUI
//
//  Created by Laurent B on 26/05/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func FirstIndex(matching : Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
