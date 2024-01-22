//
//  LettersButtonView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/21/24.
//

import SwiftUI

struct LettersButtonView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var letter: String
    var letterSize: CGFloat
    
    var body: some View {
        Button {
            gameManager.addLetter(letter: letter)
        } label: {
            Text(letter)
                .font(.system(size: letterSize))
                .bold()
                .frame(width: 45, height: 55)
                .background(Color(Constants.FoundWordsBackgroundColorName.bkColor).gradient)
                .foregroundColor(.primary)
                .cornerRadius(15)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LettersButtonView(letter: "a", letterSize: CGFloat(35))
        .environmentObject(GameManager())
}
