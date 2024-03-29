//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 02/10/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
