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
                Text("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .font(.footnote)
                    .kerning(2)
                    .padding(.horizontal, 30)
                    .foregroundStyle(Color("TextColor"))
                Text(String(game.target))
                    .font(.largeTitle)
                    .foregroundStyle(Color("TextColor"))
                    .fontWeight(.black)
                    .kerning(-1)
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $value, in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                .foregroundStyle(Color("TextColor"))
                .padding()
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
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
