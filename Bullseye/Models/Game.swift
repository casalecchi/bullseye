//
//  Game.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 06/04/24.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(guessValue: Int) -> Int {
        return 999
    }
}
