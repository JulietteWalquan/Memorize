//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 10/10/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static func createMemoryGame() -> MemoryGame<String> {
        let theme = Themes.getAllThemes()[Int.random(in: 0...2)]
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 4...20), theme: theme) { pairIndex in theme.emojis[pairIndex] }
    }
        
    @Published var model = createMemoryGame()
        
    var cards: Array<Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}
