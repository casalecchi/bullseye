//
//  Game.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 06/04/24.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderboard(score: 88)
            addToLeaderboard(score: 149)
            addToLeaderboard(score: 80)
            addToLeaderboard(score: 200)
            addToLeaderboard(score: 55)
        }
    }
    
    func points(for guessValue: Int) -> Int {
        let difference = abs(guessValue - target)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func startNewRound(points: Int) {
        addToLeaderboard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(score: Int) {
        let entry = LeaderboardEntry(score: score, date: Date())
        leaderboardEntries.append(entry)
        leaderboardEntries.sort { $0.score > $1.score }
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
