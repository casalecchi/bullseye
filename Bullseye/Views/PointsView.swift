//
//  PointsView.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 21/04/24.
//

import SwiftUI

struct PointsView: View {
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(for: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🥳🥳🥳")
            Button {
                withAnimation {
                    isAlertVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                ButtonText(text: "Start New Round")
            }
            
        }
        .padding()
        .frame(maxWidth: 300)
        .background(
            Color("BackgroundColor")
        )
        .clipShape(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius))
        .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview {
    PointsView(isAlertVisible: .constant(false), sliderValue: .constant(89), game: .constant(Game()))
}
