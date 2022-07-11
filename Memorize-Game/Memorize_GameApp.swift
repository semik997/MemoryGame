//
//  Memorize_GameApp.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import SwiftUI

@main
struct Memorize_GameApp: App {
    let game = EmojiMemoryGame()
    let theme = MemoryGameTheme()
    var body: some Scene {
        WindowGroup {
            ContentView(emojisGame: game)
        }
    }
}
