//
//  TimerView.swift
//  QuizApp
//
//  Created by csuftitan on 12/16/22.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Time Remaining: ")
                .font(.system(size: 30, weight: .semibold))
            Text("\(timeRemaining)")
                .font(.system(size: 30, weight: .semibold))
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
        }
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        timeRemaining = 20
    }

}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
