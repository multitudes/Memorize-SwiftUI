//
//  EmojiNameGameView.swift
//  Memorize-SwiftUI
//
//  Created by Laurent B on 20/05/2020.
//  Copyright © 2020 Laurent B. All rights reserved.
//

import SwiftUI

struct EmojiNameGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(300-90), clockwise: true).padding(5).opacity(0.4)
                    Text(self.card.content).font(Font.system(size: fontSize(for: size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                //.cardify(isFaceUp: card.isFaceUp)
                .modifier(Cardify(isFaceUp: card.isFaceUp))
                }
        }

    
    // MARK: - Drawing constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.70
    }
}


extension View {
    func cardify(isFaceUp: Bool) {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[2])
        return EmojiNameGameView(viewModel: game)
    }
}
