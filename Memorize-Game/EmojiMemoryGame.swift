//
//  EmojiMemoryGame.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    //Create a new memory game based on specific theme
    static func createMemoreGame(theme: MemoryGameTheme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairOfCards: theme.themeEmojis.count) { pairIndex in
            theme.themeEmojis[pairIndex]
        }
    }
    // This model is a struct
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoreGame(theme: MemoryGameTheme())
    // This is the theme of the model
    @Published private var theme: MemoryGameTheme = MemoryGameTheme()
    
    // To acces model and theme contents
    var themeName: String {
        theme.themeName
    }
    var colorCard: Color {
        theme.colorCard
    }
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intens(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    // When refreshing theme , create a new game with the new theme
    func refreshTheme() {
        theme.refreshTheme()
        model = Self.createMemoreGame(theme: theme)
    }
}
