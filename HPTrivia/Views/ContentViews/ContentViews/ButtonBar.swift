//
//  ButtonBar.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct ButtonBar: View {
    @Binding var playGame : Bool

    @Binding var animateViewsIn : Bool
    let geo : GeometryProxy
    
    var body: some View {
        
        HStack{
            Spacer()
            InstructionButtonView(animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
            PlayButton(animateViewsIn: $animateViewsIn, geo: geo, playGame: $playGame)
            Spacer()
            SettingsButton(animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
            
        } .frame(width: geo.size.width)
        
    }
}

#Preview {
    GeometryReader{ geo in
        ButtonBar(playGame: .constant(true), animateViewsIn: .constant(true), geo: geo)
    }
}
