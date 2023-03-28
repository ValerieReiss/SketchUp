//
//  MatchManager.swift
//  SketchUp
//
//  Created by Valerie on 28.03.23.
//

import Foundation

class MatchManager: ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = PlayerAuthState.authenticating
    
    @Published var currentlyDrawing = false
    @Published var drawPrompt = "Dishwasher"
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
}
