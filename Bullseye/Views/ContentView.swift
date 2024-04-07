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
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                InstructionsView(game: $game)
                SliderView(value: $value)
                HitMeButton(isAlertVisible: $isAlertVisible, game: $game, value: $value)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                .padding(.horizontal, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $value, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var isAlertVisible: Bool
    @Binding var game: Game
    @Binding var value: Double
    
    var body: some View {
        Button("Hit me".uppercased()) {
            isAlertVisible = true
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundStyle(.white)
        .cornerRadius(21)
        .bold()
        .font(.title3)
        .kerning(1)
        .alert(
            "Hello there!",
            isPresented: $isAlertVisible,
            actions: {
                Button("Testing...") {
                }
            },
            message: {
                let roundedValue = Int(value.rounded())
                Text("Your target: \(roundedValue).\nYou scored \(game.points(for: roundedValue)) points")
            })
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}


