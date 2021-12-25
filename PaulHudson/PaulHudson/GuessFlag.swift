//
//  GuessFlag.swift
//  PaulHudson
//
//  Created by naseem on 25/12/2021.
//

import SwiftUI

struct GuessFlag: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""


   @State private var countries = [AppImage.nigeriaFlag, AppImage.estoniaFlag, AppImage.franceFlag, AppImage.germanyFlag, AppImage.irelandFlag, AppImage.italyFlag, AppImage.polandFlag, AppImage.russiaFlag, AppImage.spainFlag, AppImage.ukFlag, AppImage.usFlag, AppImage.monacoFlag].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.blue
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(spacing: 50) {
                    VStack {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundColor(.white)
                                .font(.subheadline.weight(.heavy))

                            Text(countries[correctAnswer])
                                .foregroundColor(.white)
                                .font(.largeTitle.weight(.semibold))
                        }
                        .padding()
                        
                        ForEach(0..<12) { country in
                            Button{
                                flagTapped(country)
                            } label: {
                                Image(countries[country])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                            }
                        }
                        
                    }
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is ???")
            }
        }
    }
    
    func flagTapped(_ country: Int) {
        if country == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

}

struct GuessFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessFlag()
    }
}


//        LinearGradient(gradient: Gradient(colors: [.pink, .purple, .mint]), startPoint: .top, endPoint: .bottom)
//            .ignoresSafeArea()
//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .pink, location: 0.2),
//            .init(color: .purple, location: 0.4),
//            .init(color: .mint, location: 0.9)
//        ]), startPoint: .top, endPoint: .bottom)
