//
//  WinView.swift
//  Match
//
//  Created by StudentAM on 3/20/24.
//

import SwiftUI

struct WinView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("back")// frame background
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()//space between top and emoji
                    Text("🫐")//cuteness
                        .font(.custom("Silkscreen-Bold", size: 100))
                    Text("Great\n Job!")//display message
                        .font(.custom("Silkscreen-Bold", size: 46))
                    NavigationLink(destination: GameView()){//new game page(reset from prev)
                        Text("Play Again")// back to game
                            .font(.custom("Silkscreen-Bold", size: 45))
                            .foregroundStyle(.black)
                            .background(Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                            .cornerRadius(10)
                            .padding()
                    }
                    Spacer()// space between bottem and button
                }
            }
        }
        .navigationBarBackButtonHidden(true)//no ugly back button
    }
}

#Preview {
    WinView()
}
