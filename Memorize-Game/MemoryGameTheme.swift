//
//  MemoryGameTheme.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import Foundation
import Accessibility
import SwiftUI

struct MemoryGameTheme {
    
    // List of the theme
    static let allThemes: [ChoiseTheme: MemoryGameTheme] =
    [.car: MemoryGameTheme(choiseTheme: .car, themeEmojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🚲", "🚁"], themeName: "Cars", colorCard: .red),
     .animal: MemoryGameTheme(choiseTheme: .animal, themeEmojis: ["🐣", "🙉", "🙊", "🙈", "🐵", "🐽", "🐸", "🦊", "🐨", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐶", "🐱", "🐢"], themeName: "Animals", colorCard: .blue),
     .item: MemoryGameTheme(choiseTheme: .item, themeEmojis: ["💻", "⌚️", "📱", "⌨️", "🖥", "🖨", "🖲", "🕹", "🎥", "📷", "☎️", "📺", "⏰", "🎛", "📟", "📡", "🧯"], themeName: "Items", colorCard: .purple),
     .food: MemoryGameTheme(choiseTheme: .food, themeEmojis: ["🍎", "🍏", "🍊", "🍐", "🍋", "🍌", "🥭", "🍒", "🍆", "🍑", "🍓", "🫐", "🫒", "🧀", "🍟", "🍕", "🥙"], themeName: "Foods", colorCard: .yellow),
     .face: MemoryGameTheme(choiseTheme: .face, themeEmojis: ["😀", "🥳", "😋", "😗", "🥰", "😍", "😛", "😌", "😡", "🤯", "🤬", "🥵", "😫", "🧐", "☺️", "😃", "😄",], themeName: "Faces", colorCard: .green),
     .flag: MemoryGameTheme(choiseTheme: .flag, themeEmojis: ["🏳️‍🌈", "🇦🇿", "🇺🇦", "🇸🇽", "🇹🇬", "🇺🇸", "🇰🇷", "🇳🇴", "🇳🇿", "🇳🇺", "🇬🇪", "🇩🇪", "🇧🇪", "🇦🇹", "🇮🇴", "🇺🇳", "🎌"], themeName: "Flags", colorCard: .pink)]
    
    // Type of Themes
    enum ChoiseTheme: CaseIterable {
        case car
        case animal
        case item
        case food
        case face
        case flag
    }
    
    var choiseTheme: ChoiseTheme = .animal
    var themeEmojis = ["🐣", "🙉", "🙊", "🙈", "🐵", "🐽", "🐸", "🦊", "🐨", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐶", "🐱", "🐮"]
    var themeName = "Animals"
    var colorCard = Color.blue
    
    mutating func changeTheme(_ choiseTheme: ChoiseTheme) {
        let randomTheme = ChoiseTheme.allCases.randomElement()!
        //Initialise the theme from static dictionnary
        let theme = Self.allThemes[randomTheme]!
        self.choiseTheme = theme.choiseTheme
        self.themeEmojis = theme.themeEmojis
        self.themeName = theme.themeName
        self.colorCard = theme.colorCard
    }
    
    // Mutanting func to change theme
    mutating func refreshTheme() {
        changeTheme(ChoiseTheme.car)
    }
}
