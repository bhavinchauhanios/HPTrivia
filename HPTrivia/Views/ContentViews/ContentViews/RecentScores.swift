//
//  RecentScores.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct RecentScores: View {
    
    @Binding var animateViewsIn : Bool
    
    var body: some View {
        
        VStack{
            if animateViewsIn {
                VStack{
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("33")
                    Text("27")
                    Text("15")
                    
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
}
