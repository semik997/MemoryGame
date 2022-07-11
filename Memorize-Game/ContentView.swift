//
//  ContentView.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    // Emoji memory game must declared as Observed object
    // to enable SwiftUI to update when something change in it
    @ObservedObject var emojisGame: EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach (emojisGame.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                emojisGame.choose(card)
                            }
                    }
                }
            }
            // Use theme color for cards
            .foregroundColor(emojisGame.colorCard)
            Spacer()
            HStack {
                newGame
                Spacer()
                nameTheme
            }
        }
        .padding(.horizontal)
    }
    
    var newGame: some View {
        Button(action: {
            // Reset emoji game with theme change
            emojisGame.refreshTheme()
            self.onActivate()
        }, label: {
            Text("New Game")
                .font(.title)
                .fontWeight(.heavy)
        })
    }
    var nameTheme: some View {
        Text ("\(emojisGame.themeName)")
            .font(.title3)
            .fontWeight(.heavy)
    }
    
    func onActivate() {
        
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(emojisGame: game)
            .preferredColorScheme(.dark)
        ContentView(emojisGame: game)
            .preferredColorScheme(.light)
    }
}
