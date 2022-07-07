//
//  ContentView.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    var model: MemoryGameTheme
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach (viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
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
                model.refreshTheme()
        }, label: {
            Text("New Game")
                .font(.title)
                .fontWeight(.heavy)
        })
    }
    var nameTheme: some View {
        Text ("\(MemoryGameTheme.themeName)")
            .font(.title3)
            .fontWeight(.heavy)
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
        let theme = MemoryGameTheme()
        ContentView(viewModel: game, model: theme)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game, model: theme)
            .preferredColorScheme(.light)
    }
}
