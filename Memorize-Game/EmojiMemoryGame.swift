//
//  EmojiMemoryGame.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
//    static let carEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🚲", "🚁", "✈️", "🛵", "🚀", "🛶", "🛸", "⛵️", "🚅"] // red
    
    static func createMemoreGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairOfCards: MemoryGameTheme.choiseTheme.count) { pairIndex in
            MemoryGameTheme.choiseTheme[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoreGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intens(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
