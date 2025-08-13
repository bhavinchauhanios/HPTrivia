//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 11/08/25.
//

import SwiftUI

@main
struct HPTriviaApp: App {
    
    private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}

/*
 App Development Plan:
 ✅ Game Intro screen
 ✅ Gameplay Screen
 ✅ Game logic(questions, scores, etc)
 ✅ Celebration
 ✅ Audio
 ✅ Animations
 ✅ In-app purchases
 ✅ Store
 ✅ Instruction screen
 ✅ Books
 ✅ Persist scores
 */
