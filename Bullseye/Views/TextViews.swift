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

#Preview {
    VStack {
        InstructionText(text: "Teste")
        BigNumberText(text: "999")
    }
}
