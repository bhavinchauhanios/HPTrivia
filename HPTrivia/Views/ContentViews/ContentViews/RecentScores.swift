//
//  RecentScores.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct RecentScores: View {
    
    @Binding var animateViewsIn : Bool
    @Environment(Game.self) private var game
    
    var body: some View {
        
        VStack{
            if animateViewsIn {
                VStack{
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("\(game.recentScores[0])")
                    Text("\(game.recentScores[1])")
                    Text("\(game.recentScores[2])")
                    
                }
                .font(.title3)
                .padding(.horizontal)
                .foregroundStyle(.white)
                .background(.black.opacity(0.7))
                .clipShape(.rect(cornerRadius:15))
                .transition(.opacity)
            }
        }.animation(.linear(duration: 1).delay(4),value: animateViewsIn)
        
    }
}

#Preview {
    RecentScores(animateViewsIn: .constant(true))
        .environment(Game())
}
