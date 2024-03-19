//
//  ContentView.swift
//  Match
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("start")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Fruit")
                    .font(.custom("Silkscreen-Bold", size: 46))
                Text("Match")
                    .font(.custom("Silkscreen-Bold", size: 46))
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Start")
                        .font(.custom("Silkscreen-Bold", size: 46))
                        .foregroundStyle(.black)
                        .background(Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                        .cornerRadius(10)
                        .padding()
                })
                Spacer()
            }
        }
    }
        
}

#Preview {
    ContentView()
}
