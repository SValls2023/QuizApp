//
//  CardSetView.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import SwiftUI

struct CardSetView: View {
    let cardSet: IndexCardSet
    
    var body: some View {
        ScrollView {
            VStack {
                Text(cardSet.decription)
            }
            .navigationTitle(cardSet.title)
        }
    }
}

struct CardSetView_Previews: PreviewProvider {
    static var previews: some View {
        let itemSet: [IndexCardSet] = Sets().items
        CardSetView(cardSet: itemSet[0])
    }
}
