//
//  ContentView.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 11/08/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State private var audioPlayer : AVAudioPlayer!
    @State private var animateViewsIn = false

    var body: some View {
        GeometryReader{ geo in
            ZStack{
                AnimatedBackground(geo: geo)
                
                VStack{
                    
                    GameTitle(animateViewsIn: $animateViewsIn)
                    Spacer()
                    RecentScores(animateViewsIn: $animateViewsIn)
                    Spacer()
                    ButtonBar(animateViewsIn: $animateViewsIn, geo: geo)
                    Spacer()

                }
               

            }.frame(width: geo.size.width, height:  geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear{
                animateViewsIn = true
                //playAudio()
        }
           
    }
    private func playAudio(){
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        
    }
}

#Preview {
    ContentView()
        .environment(Game())
}
