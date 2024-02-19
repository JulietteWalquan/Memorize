//
//  ScoresView.swift
//  Memorize
//
//  Created by Juliette Walquan (i2101022) on 20/12/2023.
//

import SwiftUI

struct ScoresView: View {
    var body: some View {
        let scores = ScoresManager.readScores()

            List {
                ForEach(scores.sorted { ($0.toTen > $1.toTen) || ($0.toTen == $1.toTen && $0.time < $1.time) }) { score in
                    NavigationLink (destination: ScoreDetails(score: score)) {
                        HStack {
                            Text("Score: " + score.toTen.description)
                                .font(.title2)
                                .padding(.horizontal)
                            Text("Time: " + score.time.description)
                                .font(.title2)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        .navigationTitle("Scores")
        .navigationBarTitleDisplayMode(.inline)
    }
}
