//
//  GameView.swift
//  SketchUp
//
//  Created by Valerie on 28.03.23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    @State var eraserEnabled = false
    
    func makeGuess(){
        //doin nothin til now
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image(matchManager.currentlyDrawing ? "drawBg":"guesserBg")
                /*.resizable
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.1)
                */
                
                VStack{
                    topBar
                    
                    ZStack{
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay( RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 10))
                        VStack{
                            HStack{
                                
                            }
                        }
                    }
                }
                
                
            }
        }
    }
    
    var topBar: some View {
        ZStack{
            HStack{
                Button{
                    
                }label:{
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        .font(.largeTitle)
                        .tint(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
                }
                Spacer()
                
                Label("\(matchManager.remainingTime)", systemImage: "clock.fill")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
                
            }
        }
        .padding(.vertical, 15)
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
    }
}
