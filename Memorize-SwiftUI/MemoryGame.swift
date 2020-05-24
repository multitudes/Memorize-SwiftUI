//
//  MemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Laurent B on 24/05/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {
        print("card chosen \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }

}
