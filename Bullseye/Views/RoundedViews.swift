//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 08/04/24.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .frame(width: 68, height: 56)
            .foregroundStyle(Color("TextColor"))
            .kerning(-0.2)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

#Preview {
    VStack {
        RoundedImageViewStroked(systemName: "list.dash")
        RoundedImageViewFilled(systemName: "arrow.counterclockwise")
        RoundedRectTextView(text: "999")
    }
//        .preferredColorScheme(.dark)
}
