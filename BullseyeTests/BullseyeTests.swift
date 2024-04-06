//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Felipe Casalecchi on 06/04/24.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testExample() throws {
        XCTAssertEqual(game.points(guessValue: 50), 999)
    }
}
