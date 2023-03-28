//
//  Misc.swift
//  SketchUp
//
//  Created by Valerie on 28.03.23.
//

import Foundation

let everydayObject = ["pen", "paper", "book", "table", "chair", "computer",
                      "wallet", "watch", "clock", "phone", "keys", "pillow",
                      "lamp", "bed", "blanket", "sofa", "tv","remote", "car", "bicycle", "bus","train", "plane", "umbrella", "shirt", "sunglasses", "shoe", "pants", "socks", "hat", "coat", "gloves",
                        "scarf", "toothbrush", "toothpaste", "soap", "shampoo", "conditioner", "razor", "towel",
                        "dish", "silverware","glass", "plate", "microwave", "fridge","oven", "dishwasher","washing machine",
                      "dryer", "vacuum", "cleaner", "mop", "broom", "dustpan",
                      "trash can", "laundry basket", "hanger", "iron",
                      "hairbrush", "comb","nail clipper", "scissors",
                      "tape", "glue", "stapler", "paperclip", "binder",
                      "folder", "envelope", "post-it note", "calendar",
                      "whiteboard", "marker", "eraser", "pencil",
                      "ruler", "compass", "tractor",
                      "calculator", "flashlight", "battery", "extension cord", "powerstrip", "plunger", "screwdriver", "hammer", "wrench", "saw"]

enum PlayerAuthState: String {
case authenticating = "Logging in to Game Center..."
case unauthenticated = "Please sign in to Game Center to play."
case authenticated = ""
case error = "There was an error logging into Game Center."
case restricted = "You're not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100
