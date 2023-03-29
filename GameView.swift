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
                Image(matchManager.currentlyDrawing ? "drawerBg" : "guesserBg")
                /*.resizable
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.1)*/
                
                VStack{
                    topBar
                    
                    ZStack{
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay( RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 10))
                        VStack{
                            HStack{
                                Spacer()
                                
                                if matchManager.currentlyDrawing {
                                    Button{
                                        eraserEnabled.toggle()
                                    } label: {
                                        Image(systemName: eraserEnabled ? "eraser.fill" : "eraser")
                                            .font(.title)
                                            .foregroundColor(Color("primaryPurple"))
                                            .padding(.top, 10)
                                    }
                                }
                            }
                            Spacer()
                            
                            
                        }
                        .padding()
                    }
                    pastGuesses
                }
                .padding(.horizontal, 30)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            VStack{
                Spacer()
                
                promptGroup
            }
            .ignoresSafeArea(.container)
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
    
    var pastGuesses: some View{
        ScrollView{
            ForEach(matchManager.pastGuesses){ guess in
                HStack{
                    Text(guess.message)
                        .font(.title2)
                        .bold(guess.correct)
                    if guess.correct {
                        Image(systemName: "hand.thumbup.fill")
                            .foregroundColor(matchManager.currentlyDrawing ?
                              Color(red:0.811, green:0.311, blue:0.711) :
                              Color(red:0.211, green:0.711, blue:0.711)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            (matchManager.currentlyDrawing ? Color(red: 0.211, green:0.711, blue:0.711) : Color("primaryYellow"))
                .brightness(-0.2)
                .opacity(0.5)
            )
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.bottom, 130)
    }
    var promptGroup: some View{
        VStack{
            if matchManager.currentlyDrawing{
                Label("DRAW:", systemImage: "exclamationmark.bubble.fill")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text(matchManager.drawPrompt.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(Color("primaryYellow"))
            } else {
                HStack{
                    Label("GUESS THE DRAWING!", systemImage: "exclamationmark.bubble.fill")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("primaryPurple"))
                    Spacer()
                }
                HStack{
                    TextField("Type your guess", text: $drawingGuess)
                        .padding()
                        .background(
                            Capsule(style: .circular)
                                .fill(.white)
                        )
                        .onSubmit (makeGuess)
                    
                    Button{
                        makeGuess()
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .renderingMode(.original)
                            .foregroundColor(Color("primaryPurple"))
                            .font(.system(size: 50))
                        
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding([.horizontal, .bottom], 10)
        .padding(.vertical)
        .background(
            (matchManager.currentlyDrawing ?
             Color(red: 0.211, green: 0.711, blue: 0.711) :
                Color("primaryYellow")
            )
            .opacity(0.5)
            .brightness(-0.2)
            
        )
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(matchManager: MatchManager())
    }
}
