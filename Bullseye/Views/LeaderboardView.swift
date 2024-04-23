//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 23/04/24.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var isLeaderboardShowing: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(isLeaderboardShowing: $isLeaderboardShowing)
                LabelView()
                RowView(index: 1, score: 20, date: Date())
            }
        }
    }
}

struct HeaderView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Binding var isLeaderboardShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    isLeaderboardShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
        }
        .padding(.horizontal)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView : View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(text: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

#Preview {
    LeaderboardView(isLeaderboardShowing: .constant(false))
}
