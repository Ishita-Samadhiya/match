//
//  ContentView.swift
//  Match
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("start") // background
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer() // space between top and title
                    Text("Fruit")//separate to align new font perfectly
                        .font(.custom("Silkscreen-Bold", size: 46))
                    Text("Match")
                        .font(.custom("Silkscreen-Bold", size: 46))//custom font used
                    Spacer()//space between start button and title
                    NavigationLink(destination: GameView()){ // start button styling to link to game page
                        Text("Start")
                            .font(.custom("Silkscreen-Bold", size: 46))
                            .foregroundStyle(.black)
                            .background(Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                            .cornerRadius(10)
                            .padding()
                    }
                    Spacer()//space between bottom and start button
                }
            }
        }
    }
        
}

#Preview {
    ContentView()
}
