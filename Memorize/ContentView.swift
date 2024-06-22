//
//  ContentView.swift
//  Memorize
//
//  Created by Carlos A. Sanchez on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "😈", "🦄", "🐵", "🐸", "🐼"]
    @State var cardCount = 1

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
//        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardCountAdjuster(by: -1, symbol: "minus.circle")
            Spacer()
            cardCountAdjuster(by: 1, symbol: "plus.circle")
        }
        .imageScale(.large)
        .font(.title)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button("Remove"){
//            cardCount -= 1
//        }
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
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
    ContentView()
}
