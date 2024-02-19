//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 10/10/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    var time = 0
    var timer = Timer()

    static func createMemoryGame() -> MemoryGame<String> {
        var theme = Themes.getAllThemes()[Int.random(in: 0...2)]

        theme.emojis.shuffle()

        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 4...10), theme: theme) { pairIndex in theme.emojis[pairIndex] }
    }

    @Published var model = createMemoryGame()

    var cards: Array<Card> {
        model.cards
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addTime), userInfo: nil, repeats: true)
    }

    @objc func addTime() {
        self.time += 1
    }

    func stopTimer() {
        timer.invalidate()
        model.time = self.time
    }
    
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}
