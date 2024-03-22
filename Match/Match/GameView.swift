//
//  GameView.swift
//  Match
//
//  Created by StudentAM on 3/20/24.
//

import SwiftUI

struct GameView: View {
    // all vars needed
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)
    @State var emojis = ["🍇", "🍇" ,"🍉", "🍉", "🥝", "🥝", "🫐", "🫐", "🍑", "🍑", "🍓", "🍓"].shuffled()//shuffle every time page runs again
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1
    @State private var score: Int = 0
    @State private var isDelaying: Bool = false
    let Grid : [GridItem] = [ // grid with 3 cols
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]
    var body: some View {
        NavigationView{
            ZStack{
                Image("back") // frame background
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{ // for game
                    Text("Score: \(score)")//display score
                        .font(.custom("Silkscreen-Bold", size: 36))
                        .foregroundStyle(.black)
                        .background(Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                        .cornerRadius(10)
                        .padding(.vertical, 50)
                        LazyVGrid(columns: Grid) {// display grid
                            ForEach(emojis.indices, id: \.self) { item in
                                CardView(emoji: emojis[item], flipped: cardsFlipped[item])
                                    .onTapGesture(perform: {// card tapped
                                        cardsFlipped[item].toggle()// flip card
                                        if pickOne == -1 { // pick empty then set
                                            pickOne = item
                                        }else{
                                            if item != pickOne{ // doesn't let user pick same item twice
                                                pickTwo = item// if pick one full, select pick two
                                                if emojis[pickOne] == emojis[pickTwo]{// correct
                                                    score += 1
                                                    pickOne = -1
                                                    pickTwo = -1
                                                } else{//wrong
                                                    isDelaying = true // start the delay to disable clicks
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                                        // flip back after 2 seconds
                                                        cardsFlipped[pickTwo].toggle()
                                                        cardsFlipped[pickOne].toggle()
                                                        pickOne = -1
                                                        pickTwo = -1
                                                        //stop disabling clicks
                                                        isDelaying = false
                                                    }
                                                }
                                            }
                                        }
                                    })
                            }
                            .padding(.vertical, 10)
                        }
                        .padding(.horizontal, 90)
                    if score == 6{ // game won when score 6
                        NavigationLink(destination: WinView()){// link to end page
                            Text("Next")//next button
                                .font(.custom("Silkscreen-Bold", size: 46))
                                .foregroundStyle(.black)
                                .background(Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                                .cornerRadius(10)
                                .padding()
                        }
                        Button(action: {
                            emojis.shuffle()// reshuffle emojis
                            score = 0 // reset score
                            cardsFlipped = Array(repeating: false, count: 16)// reset flips
                        }) {
                            Text("Retry") // reset button
                                .font(.custom("Silkscreen-Bold", size: 46))
                                .foregroundColor(.black)
                                .background(Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                }
                if isDelaying { //rect on top: user only clicks rect to disable clicking while delaying
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black.opacity(0.001))
                        .frame(width: 300, height: 600)
                        .edgesIgnoringSafeArea(.all)
                }
            }
       }
        .navigationBarBackButtonHidden(true)//no ugly back button
    }
}

#Preview {
    GameView()
}
