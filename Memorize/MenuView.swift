//
//  MenuView.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 04/12/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                TitleView()
                PlayLink()
                ScoresLink()
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TitleView: View {
    var body: some View {
        Text("Memory Game")
            .font(.largeTitle)
    }
}

var gameView = EmojiMemoryGameView(game: EmojiMemoryGame())
struct PlayLink: View {
    var body: some View {
        NavigationLink(destination: gameView) {
            Text("Play")
                .font(.title)
        }
    }
}

struct ScoresLink: View {
    var body: some View {
        NavigationLink(destination: ScoresView()) {
            Text("Scores")
                .font(.title)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)

        MenuView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
