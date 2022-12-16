//
//  CardView.swift
//  QuizApp
//
//  Created by csuftitan on 12/15/22.
//

import SwiftUI

struct CardView: View {
    let card: IndexCard
        
        var body: some View {
            ScrollView {
                VStack {
                    Text(card.definition)
                }
                .navigationTitle(card.term)
            }
        }
    }

    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            let itemSet: [IndexCard] = Cards().items
            CardView(card: itemSet[0])
        }
    }
