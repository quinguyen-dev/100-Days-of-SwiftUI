//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Qui Nguyen on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    private let MAX_ROUNDS = 8
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var scoreMessage = ""
    
    private var hasCompleted: Bool {
        score == MAX_ROUNDS
    }
    
    var body: some View {
        VStack {
            Text("Guess the Flag")
                .font(.largeTitle.weight(.bold))
            
            Text("Score: \(score)")
                .font(.headline.weight(.bold))
            
            VStack (spacing: 15) {
                VStack {
                    Text("Which flag is \(countries[correctAnswer])?")
                        .font(.title.weight(.bold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .shadow(radius: 5)
                            .border(colorScheme == .dark ? .white : .clear)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .clipShape(.rect(cornerRadius: 20))
        }
        
        /* Notify user of current score and if valid flag */
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
        
        /* Notify of game complete */
        .alert("Congratulations", isPresented: .constant(hasCompleted)) {
            Button("Restart") {
                score = 0
            }
        } message: {
            Text("You guesssed \(MAX_ROUNDS) countries correctly! Restart the game to play again.")
        }
    }
    
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct!" : "You chose the wrong flag!"
       
        if (scoreTitle == "Correct!") {
            score += 1
            scoreMessage = "Your score is \(score)."
        } else {
            if score > 0 {
                score -= 1;
            }
            
            scoreMessage = "You guessed \(countries[number]). You lost a point!"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
