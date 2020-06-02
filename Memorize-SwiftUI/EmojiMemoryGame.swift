//
//  EmojiMemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Laurent B on 24/05/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["⻤","🎃","🕷"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {
            pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // Mark: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    // Mark: Intent
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
