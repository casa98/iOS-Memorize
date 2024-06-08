//
//  ContentView.swift
//  Memorize
//
//  Created by Carlos A. Sanchez on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
        
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 16.0)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 16.0)
                    .strokeBorder(
                        style: StrokeStyle(lineWidth: 2.0)
                    )
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 16.0)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
