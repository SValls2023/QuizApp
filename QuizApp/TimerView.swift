//
//  TimerView.swift
//  QuizApp
//
//  Created by csuftitan on 12/16/22.
//

import SwiftUI

struct TimerView: View {
    @State private var endGame = false
    // Check for if players want to try again
    @State private var startGame = false
    @State private var score = 0
    @State var timeRemaining = 20
    @State private var alertTitle = "Times up!"
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Tap Count Timer Game")
                    .font(.system(size: 36, weight: .bold))
                    .padding()
                Text("Time Remaining: ")
                    .font(.system(size: 25, weight: .semibold))
                Text("\(timeRemaining)")
                    .font(.system(size: 25, weight: .semibold))
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 && startGame == true{
                            timeRemaining -= 1
                        }
                        if timeRemaining == 0 && startGame == true{
                            endGame = true
                        }
                    }
                Button("Tap me"){
                    if startGame == true {
                        score += 1
                    }
                    else {
                        // do nothing
                    }
                }
                .padding(50)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            .alert(alertTitle, isPresented: $endGame) {
                Button("Restart", action: reset)
                Button("Cancel", action: stopGame)
            } message: {
                Text("You tapped the button \(score) times!")
            }
            .toolbar {
                Button("Start Game", action: reset)
            }
        }
    }
    
    
    func reset() {
        endGame = false
        timeRemaining = 20
        score = 0
        startGame = true
    }
    
    func stopGame() {
        endGame = false
        startGame = false
    }

}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
