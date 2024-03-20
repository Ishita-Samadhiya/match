//
//  CardView.swift
//  Match
//
//  Created by StudentAM on 3/20/24.
//

import SwiftUI

struct CardView: View {
    var emoji: String
    var flipped: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(flipped ? Color.clear:Color(UIColor(red:1, green:0.5 ,blue:0.5 , alpha:1.00)))
                .frame(width: 60, height: 60)
            if flipped{
                Text("🫐")
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
