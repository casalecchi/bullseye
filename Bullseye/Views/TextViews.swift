//
//  TextViews.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 07/04/24.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .kerning(2)
            .foregroundStyle(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(Color("TextColor"))
            .fontWeight(.black)
            .kerning(-1)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundStyle(Color("TextColor"))
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.caption)
            .foregroundStyle(Color("TextColor"))
            .kerning(1.5)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .lineSpacing(12)
            .multilineTextAlignment(.center)
            .foregroundStyle(Color("TextColor"))
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundStyle(.white)
    }
}

struct ScoreText: View {
    var text: Int
    
    var body: some View {
        Text(String(text))
            .font(.title2)
            .bold()
            .foregroundStyle(Color("TextColor"))
            .kerning(-0.2)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .font(.title2)
            .bold()
            .foregroundStyle(Color("TextColor"))
            .kerning(-0.2)
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .fontWeight(.black)
            .foregroundStyle(Color("TextColor"))
            .font(.title)
            .kerning(2)
    }
}

#Preview {
    VStack {
        InstructionText(text: "Teste")
        BigNumberText(text: "999")
        SliderLabelText(text: "99")
        LabelText(text: "Score")
        BodyText(text: "You scored 200 Points\n🥳🥳🥳")
        ButtonText(text: "Start New Round")
        ScoreText(text: 100)
        DateText(date: .now)
        BigBoldText(text: "Leaderboard")
    }
    .padding()
}
