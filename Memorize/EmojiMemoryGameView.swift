//
//  ContentView.swift
//  Memorize
//
//  Created by Carlos A. Sanchez on 14/02/24.
//

import SwiftUI

// View
struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis: Array<String> = ["👻", "🎃", "😈", "🦄", "🐵", "🐸", "🐼"]
    @State var cardCount = 6

    var body: some View {
        VStack {
            cards
        }
        .padding()
    }
    
    var cards: some View {
//        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3 , contentMode: .fit)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let content: String
    var body: some View {
        ZStack (alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 16.0)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
           
        }
        .onTapGesture {
//            isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
