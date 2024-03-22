//
//  CardView.swift
//  Match
//
//  Created by StudentAM on 3/20/24.
//

import SwiftUI

struct CardView: View {//view per card
    //params passed
    var emoji: String
    var flipped: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)// cute little card
                .fill(flipped ? Color.clear:Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))// switches to clear when flips
                .frame(width: 60, height: 60)
            if flipped{//adds emoji on top when flips
                Text(emoji)// cute lil emoji :)
                    .font(.custom("Silkscreen-Bold", size: 46))
                    .cornerRadius(10)
                    .padding(10)
            }
        }
    }
}

#Preview {
    CardView(emoji:"🫐",flipped: false)
}
