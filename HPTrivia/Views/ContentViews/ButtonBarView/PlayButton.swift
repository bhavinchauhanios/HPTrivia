//
//  PlayButton.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct PlayButton: View {
    
    @Binding var animateViewsIn : Bool
    let geo : GeometryProxy
    @State private var playGame = false
    @State private var scalePlayButton = false

    var body: some View {
        
        VStack{
            if animateViewsIn{
                Button {
                    playGame.toggle()
                } label: {
                    Text("Play")
                        .font(.largeTitle)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 7)
                        .background(.brown)
                        .foregroundStyle(.white)
                        .cornerRadius(7)
                        .shadow(radius: 5)
                        .scaleEffect(scalePlayButton ? 1.2 : 1)
                    
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                scalePlayButton.toggle()
                            }
                        }
                    
                }
                .transition(.offset(y: geo.size.height/3))
                
            }
        
        }
        .animation(.easeInOut(duration: 0.7).delay(2), value: animateViewsIn)
        
    }
}

#Preview {
    
    GeometryReader{ geo in
        PlayButton(animateViewsIn: .constant(true), geo: geo)
    }
    
}
