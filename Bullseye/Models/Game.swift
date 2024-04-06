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
    
    func points(for guessValue: Int) -> Int {
        100 - abs(guessValue - target)
    }
}
