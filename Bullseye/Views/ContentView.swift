//
//  ContentView.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible = false
    @State private var value = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
                .kerning(2)
            Text(String(game.target))
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $value, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                isAlertVisible = true
            }
            .alert(
                "Hello there!",
                isPresented: $isAlertVisible,
                actions: {
                    Button("Testing...") { 
                        value = 50
                    }
                },
                message: {
                    let roundedValue = Int(value.rounded())
                    Text("Your target: \(roundedValue).\nYou scored \(game.points(for: roundedValue)) points")
                })
        }
    }
}

#Preview {
    ContentView()
}
