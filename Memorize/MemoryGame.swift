//
//  MemoryGame.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 10/10/2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var endParty = false
    
    private(set) var cards: Array<Card>
    var nbNotMatched: Int
    var score: Int
    let theme: Themes.Theme
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue) }) }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    calculScore(add: true, numberMalus: 0)
                    
                    nbNotMatched -= 1
                    if nbNotMatched == 0 {
                        endParty = true
                    }
                } else {
                    var malus = 2
                    
                    if cards[chosenIndex].isFirstTime {
                        malus -= 1
                        cards[chosenIndex].isFirstTime = false
                    }
                    
                    if cards[potentialMatchIndex].isFirstTime {
                        malus -= 1
                        cards[potentialMatchIndex].isFirstTime = false
                    }
                    
                    calculScore(add: false, numberMalus: malus)
                }
                
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func calculScore(add: Bool, numberMalus: Int) {
        if add {
            score += 2
        } else {
            score -= numberMalus
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: Themes.Theme, createCardContent: (Int) -> CardContent) {
        self.theme = theme
        self.nbNotMatched = numberOfPairsOfCards
        self.score = 0
        
        cards = []
        
        // add numberOfPairsOfCards *2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id:pairIndex*2+1, content: content))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        let id: Int
        
        var isFaceUp = false
        var isMatched = false
        var isFirstTime = true
        let content: CardContent
    }
}



extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
