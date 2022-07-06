//
//  EmojiMemoryGame.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let carEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🚲", "🚁", "✈️", "🛵", "🚀", "🛶", "🛸", "⛵️", "🚅"]
    
    static func createMemortGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 8) { pairIndex in
            carEmojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemortGame()
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    // MARK: - Intens(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
