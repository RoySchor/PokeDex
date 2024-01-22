//
//  ActionButtons.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/22/24.
//

import SwiftUI

struct ActionButtons: View {
    var body: some View {
        HStack(spacing: 10) {
            Button {
                
            } label: {
                Image(systemName: "shuffle")
                    .font(.system(size: 30, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
            Spacer()
                .frame(width: 10)
            Button {
                
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 40, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
            Spacer()
                .frame(width: 10)
            Button {
                
            } label: {
                Image(systemName: "lightbulb.min.badge.exclamationmark.fill")
                    .font(.system(size: 30, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
            Spacer()
                .frame(width: 10)
            Button {
                
            } label: {
                Image(systemName: "arrow.counterclockwise.circle")
                    .font(.system(size: 40, weight: .heavy))
                    .bold()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.primary)
                    .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                    .cornerRadius(15)
            }
        }
    }
}

#Preview {
    ActionButtons()
}
