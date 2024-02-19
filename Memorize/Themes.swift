//
//  Themes.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 10/11/2023.
//

import SwiftUI

class Themes {
    struct Theme {
        var emojis: Array<String>
        var color: Color
    }

    static let transportsTheme = Theme(emojis: ["🚗", "🚌", "🏎", "🚓", "🚑", "🚒", "🚐", "🚛", "🚜", "🛵", "🏍", "🛺", "🚡", "🚝", "🚂", "✈️", "🚀", "🚁", "🛶", "🛳"],
                                       color: Color.red)

    static let animalsTheme = Theme(emojis: ["🐶", "🐱", "🐭", "🦊", "🐻", "🐯", "🐮", "🐷", "🐸", "🐔", "🐵", "🦇", "🐺", "🐝", "🐌", "🐢", "🦕", "🦚", "🐳", "🐙"],
                                    color: Color.blue)

    static let foodTheme = Theme(emojis: ["🍎", "🍊", "🍉", "🍓", "🍑", "🥥", "🥑", "🌽", "🥐", "🧀", "🥩", "🌭", "🍔", "🍕", "🌮", "🍜", "🍙", "🍪", "🍫", "🍿"],
                                 color: Color.green)
    
    static func getAllThemes() -> Array<Theme> {
        [transportsTheme, animalsTheme, foodTheme]
    }
}
