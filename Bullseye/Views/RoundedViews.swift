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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundStyle(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
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
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundStyle(Color("TextColor"))
            .kerning(-0.2)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title2)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundStyle(Color("TextColor"))
            .overlay(
                Circle()
                    .stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

#Preview {
    VStack {
        RoundedImageViewStroked(systemName: "list.dash")
        RoundedImageViewFilled(systemName: "arrow.counterclockwise")
        RoundedRectTextView(text: "999")
        RoundedTextView(text: "1")
    }
//        .preferredColorScheme(.dark)
}
