//
//  Themes.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 10/11/2023.
//

import SwiftUI

class Themes {
    struct Theme {
        var name: String
        var emojis: Array<String>
        var color: Color
    }

    struct CodableTheme: Codable {
        var name: String
        var emojis: String
        var color: String
    }

    static let transportsTheme = Theme(name: "Transport", emojis: ["🚗", "🚌", "🏎", "🚓", "🚑", "🚒", "🚐", "🚛", "🚜", "🛵", "🏍", "🛺", "🚡", "🚝", "🚂", "✈️", "🚀", "🚁", "🛶", "🛳"],
                                       color: Color.red)

    static let animalsTheme = Theme(name: "Animal", emojis: ["🐶", "🐱", "🐭", "🦊", "🐻", "🐯", "🐮", "🐷", "🐸", "🐔", "🐵", "🦇", "🐺", "🐝", "🐌", "🐢", "🦕", "🦚", "🐳", "🐙"],
                                    color: Color.blue)

    static let foodTheme = Theme(name: "Food", emojis: ["🍎", "🍊", "🍉", "🍓", "🍑", "🥥", "🥑", "🌽", "🥐", "🧀", "🥩", "🌭", "🍔", "🍕", "🌮", "🍜", "🍙", "🍪", "🍫", "🍿"],
                                 color: Color.green)

    static func getAllThemes() -> Array<Theme> {
        [transportsTheme, animalsTheme, foodTheme]
    }
}
