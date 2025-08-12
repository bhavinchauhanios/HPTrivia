//
//  SettingsButton.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct SettingsButton: View {
    
    @Binding var animateViewsIn : Bool
    let geo : GeometryProxy
    @State private var showSettings = false

    var body: some View {
        
        VStack{
            if animateViewsIn{
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(y: geo.size.height/4))

            }
        }
        .animation(.easeInOut(duration: 0.7).delay(2.7),value:animateViewsIn)
        
    }
}

#Preview {
    GeometryReader{ geo in
        SettingsButton(animateViewsIn: .constant(true), geo: geo)
    }
}
