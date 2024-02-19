//
//  ScoreDetails.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 21/12/2023.
//

import SwiftUI

struct ScoreDetails: View {
    let score: ScoresManager.Score

    var body: some View {
        VStack {
            Text("🐴")
                .font(.largeTitle)
                .padding()

            Score(score: score)
                .padding()
            TimeView(score: score)
                .padding()
            ThemeView(score: score)
                .padding()
            DateView(score: score)
                .padding()

            Text(score.theme.emojis)
                .font(.title3)
                .padding()
        }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct Score: View {
    let score: ScoresManager.Score

    var body: some View {
        HStack {
            Text("Score")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(score.score.description + "/" + score.scoreMax.description)
                .font(.title2)
        }
    }
}

struct TimeView: View {
    let score: ScoresManager.Score

    var body: some View {
        HStack {
            Text("in")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(score.time.description + "s")
                .font(.title2)
        }
    }
}

struct ThemeView: View {
    let score: ScoresManager.Score

    var body: some View {
        HStack {
            Text("with the theme")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(score.theme.name)
                .font(.title2)
        }
    }
}

struct DateView: View {
    let score: ScoresManager.Score

    var body: some View {
        HStack {
            Text("on")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(score.date.description)
                .font(.title2)
        }
    }
}
