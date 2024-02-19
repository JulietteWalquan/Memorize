//
//  ScoresManager.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 21/12/2023.
//

import Foundation

class ScoresManager {
    private static var count = 0

    struct Score: Codable, Identifiable {
        let id: Int

        var theme: Themes.CodableTheme
        var score: Int
        var scoreMax: Int
        var toTen: Float
        var time: Int
        var date: String
    }


    public static func readScores() -> Array<Score> {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("scores.json")

        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath.path))
            let data = try JSONDecoder().decode(Array<Score>.self, from: jsonData)
            print(data)
            return data
        } catch {
            print("Error reading from JSON file: \(error)")

            var dataFail: Array<Score> = Array()
            dataFail.append(Score(id: 0, theme: Themes.CodableTheme(name: "nil", emojis: "", color: ""), score: 0, scoreMax: 0, toTen: 0, time: 0, date: Date.now.description))
            return dataFail
        }
    }

    public static func storeScore(scores: Array<Score>, theme: Themes.CodableTheme, score: Int, scoreMax: Int, time: Int, date: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("scores.json")

        count = scores.count + 1
        let newScore = Score(id: count, theme: theme, score: score, scoreMax: scoreMax, toTen: Float((score*10)/scoreMax), time: time, date: date)
        var previousScores = scores
        previousScores.append(newScore)

        do {
            let jsonData = try JSONEncoder().encode(previousScores)
            print(jsonData.description)
            try jsonData.write(to: filePath)
        } catch {
            print("Error writing to JSON file: \(error)")
        }
    }
}
