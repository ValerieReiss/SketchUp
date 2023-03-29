//
//  MenuView.swift
//  SketchUp
//
//  Created by Valerie on 28.03.23.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    var body: some View {
        VStack{
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding(30)
            
            Spacer()
            
            Button{
                //matchmaking menu,...
            } label:{
            Text("Play")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
            }
            .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
            .padding(.vertical, 20)
            .padding(.horizontal, 100)
            .background(
                Capsule(style: .circular)
                    .fill(matchManager.authenticationState != .authenticated || matchManager.inGame ? .gray : Color("playBtn"))
            )
            
            Text(matchManager.authenticationState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundColor(Color("primaryYellow"))
                .padding()
            
            Spacer()
        }
        .background(Image("menuBg")
            .resizable()
            .scaledToFill()
            .scaleEffect(1.1))
        .ignoresSafeArea()
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(matchManager: MatchManager())
    }
}
