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
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, isAlertVisible ? 0 : 100)
                if isAlertVisible {
                    PointsView(isAlertVisible: $isAlertVisible, sliderValue: $value, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(isAlertVisible: $isAlertVisible, game: $game, value: $value)
                        .transition(.scale)
                }
            }
            if !isAlertVisible {
                SliderView(value: $value)
                    .zIndex(1)
                    .transition(.scale)
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
                .frame(width: 35)
            Slider(value: $value, in: 1.0...100.0)
            SliderLabelText(text: "100")
                .frame(width: 35)
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
            withAnimation {
                isAlertVisible = true
            }
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        .foregroundStyle(.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .bold()
        .font(.title3)
        .kerning(1)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}


