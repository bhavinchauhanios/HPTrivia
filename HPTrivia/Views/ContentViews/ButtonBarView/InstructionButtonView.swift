//
//  InstructionView.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct InstructionButtonView: View {
   
    @State var showInInstruction = false
    @Binding var animateViewsIn : Bool
    let geo : GeometryProxy

    var body: some View {
        
        VStack{
            if  animateViewsIn{
                Button {
                    showInInstruction.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(y: -geo.size.height/4))

            }
        }
        .animation(.easeInOut(duration: 0.7).delay(2.7),value:animateViewsIn)
        
        .sheet(isPresented: $showInInstruction) {
            Instructions()
        }
    }
}

#Preview {
    GeometryReader{ geo in
        InstructionButtonView(animateViewsIn: .constant(true), geo: geo)
    }

}
