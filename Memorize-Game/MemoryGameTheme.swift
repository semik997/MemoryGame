//
//  MemoryGameTheme.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import Foundation
import Accessibility

class MemoryGameTheme: ObservableObject {
    
    enum ChoiseTheme: CaseIterable {
        case car
        case animal
        case item
        case food
        case face
    }
    
    static var choiseTheme = ["🐣", "🙉", "🙊", "🙈", "🐵", "🐽", "🐸", "🦊", "🐨", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐶", "🐱", "🐮"]
    
    func theme(_ choiseTheme: ChoiseTheme) {
        let randomTheme = ChoiseTheme.allCases.randomElement()!
        switch randomTheme {
        case .car:
            let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🏍", "🚲", "🚁", "✈️", "🛵", "🚀", "🛶", "🛸", "⛵️", "🚅"] // red
            MemoryGameTheme.choiseTheme = emojis
        case .animal:
            let emojis = ["🐣", "🙉", "🙊", "🙈", "🐵", "🐽", "🐸", "🦊", "🐨", "🐹", "🐰", "🐻", "🐼", "🐻‍❄️", "🐶", "🐱", "🐮"]
            // gray
            MemoryGameTheme.choiseTheme = emojis
        case .item:
            let emojis = ["💻", "⌚️", "📱", "⌨️", "🖥", "🖨", "🖲", "🕹", "🎥", "📷", "☎️", "📺", "⏰", "🎛", "📟", "📡", "🧯"]
            // purple
            MemoryGameTheme.choiseTheme = emojis
        case .food:
            let emojis = ["🍎", "🍏", "🍊", "🍐", "🍋", "🍌", "🥭", "🍒", "🍆", "🍑", "🍓", "🫐", "🫒", "🧀", "🍟", "🍕", "🥙"]
            // yelow
            MemoryGameTheme.choiseTheme = emojis
        case .face:
            let emojis = ["😀", "🥳", "😋", "😗", "🥰", "😍", "😛", "😌", "😡", "🤯", "🤬", "🥵", "😫", "🧐", "☺️", "😃", "😄", "😁"] // green
            MemoryGameTheme.choiseTheme = emojis
        }
        print(randomTheme)
        print(MemoryGameTheme.choiseTheme)
    }
    
    func refreshTheme() {
        theme(ChoiseTheme.car)
        
    }
    
    
}
    
