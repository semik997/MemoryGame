//
//  MemoryGameTheme.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import Foundation
import Accessibility
import SwiftUI

class MemoryGameTheme: ObservableObject {
    
    enum ChoiseTheme: CaseIterable {
        case car
        case animal
        case item
        case food
        case face
    }
    
    static var choiseTheme = ["🐣", "🙉", "🙊", "🙈", "🐵", "🐽", "🐸", "🦊", "🐨", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐶", "🐱", "🐮"]
    static var themeName = "Animals"
    static var colorCard = Color.gray
    
    func theme(_ choiseTheme: ChoiseTheme) {
        let randomTheme = ChoiseTheme.allCases.randomElement()!
        switch randomTheme {
        case .car:
            let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🚲", "🚁", "✈️", "🛵", "🚀", "🛶", "🛸", "⛵️", "🚅"] // red
            MemoryGameTheme.choiseTheme = emojis
            MemoryGameTheme.themeName = "Cars"
            MemoryGameTheme.colorCard = .red
        case .animal:
            let emojis = ["🐣", "🙉", "🙊", "🙈", "🐵", "🐽", "🐸", "🦊", "🐨", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐶", "🐱", "🐮"]
            // gray
            MemoryGameTheme.choiseTheme = emojis
            MemoryGameTheme.themeName = "Animals"
            MemoryGameTheme.colorCard = .gray
        case .item:
            let emojis = ["💻", "⌚️", "📱", "⌨️", "🖥", "🖨", "🖲", "🕹", "🎥", "📷", "☎️", "📺", "⏰", "🎛", "📟", "📡", "🧯"]
            // purple
            MemoryGameTheme.choiseTheme = emojis
            MemoryGameTheme.themeName = "Items"
            MemoryGameTheme.colorCard = .purple
        case .food:
            let emojis = ["🍎", "🍏", "🍊", "🍐", "🍋", "🍌", "🥭", "🍒", "🍆", "🍑", "🍓", "🫐", "🫒", "🧀", "🍟", "🍕", "🥙"]
            // yelow
            MemoryGameTheme.choiseTheme = emojis
            MemoryGameTheme.themeName = "Food"
            MemoryGameTheme.colorCard = .yellow
        case .face:
            let emojis = ["😀", "🥳", "😋", "😗", "🥰", "😍", "😛", "😌", "😡", "🤯", "🤬", "🥵", "😫", "🧐", "☺️", "😃", "😄", "😁"] // green
            MemoryGameTheme.choiseTheme = emojis
            MemoryGameTheme.themeName = "Face"
            MemoryGameTheme.colorCard = .green
        }
        print(randomTheme)
        print(MemoryGameTheme.choiseTheme)
    }
    
    func refreshTheme() {
        theme(ChoiseTheme.car)
        
    }
    
    
}

