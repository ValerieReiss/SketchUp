//
//  SketchUpApp.swift
//  SketchUp
//
//  Created by Valerie on 28.03.23.
//

import SwiftUI

@main
struct SketchUpApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView(matchManager: MatchManager())
        }
    }
}
