//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 02/10/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScoreView(color: game.model.theme.color, score: game.model.score.description)
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                if card.isMatched && !card.isFaceUp && game.model.nbNotMatched != 0 {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card, nbNotMatched: game.model.nbNotMatched)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                        .alert("End of the party", isPresented: $game.model.endParty) {
                            Button("New Game", role: .cancel, action: initNewGame)
                        } message: {
                            Text("Your score is " + game.model.score.description)
                        }
                }
            })
                .foregroundColor(game.model.theme.color)
            .padding(.horizontal)
            
            Button(action: initNewGame) {
                Text("New Game").foregroundColor(game.model.theme.color).font(.largeTitle)
            }
        }
    }
    
    private func initNewGame() {
        game.model = EmojiMemoryGame.createMemoryGame()
    }
}

struct ScoreView: View {
    let color: Color
    let score: String
    
    var body: some View {
        HStack {
            Text("Score: ").foregroundColor(color).font(.largeTitle)
            
            Text(score).foregroundColor(color).font(.largeTitle)
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    let nbNotMatched: Int
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstancts.cornerRadius)
                
                if card.isFaceUp || nbNotMatched == 0 {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    
                    shape.strokeBorder(lineWidth: DrawingConstancts.lineWidth)
                            
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched && nbNotMatched != 0 {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstancts.fontScale)
    }
    
    private struct DrawingConstancts {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}

struct ngButton: View {
    var body: some View {
        Button("NG+", action: initNewGame)
    }
    
    private func initNewGame() {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
