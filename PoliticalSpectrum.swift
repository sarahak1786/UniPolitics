//
//  PoliticalSpectrum.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/11/23.
//

import CoreData
import SwiftUI

struct PoliticalSpectrum: View {
    
    //Core Data
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc

    //Scale Current Index
    @State private var currentIndex = 0
    
    //Current user choice, total points, current question, and userPoint
    @State private var userChoice = "Neutral"
    @State private var totalPoints = 0
    
    //Question and NavigationLink
    @State private var currentQuestion = 1
    @State private var doneTest = false
    
    //Disable
    @State private var disableIncrement = false
    @State private var showResults = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Text("Indicate your stance on the issue described below. Each question is designed to be single-subject.")
                        .padding()
                        .font(.title3)
                        .italic()
                    
                    Spacer()
                    
                    Image(decorative: "Awareness")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Question \(currentQuestion)")
                        .padding(5)
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Text(Information.shared.questions[currentIndex])
                        .font(.title2)
                    
                    HStack {
                        Picker("", selection: $userChoice) {
                            ForEach(Information.shared.scaleName, id: \.self) {
                                Text($0)
                                    .font(.callout.bold())
                                    .foregroundColor(.blue)
                                    .minimumScaleFactor(0.6)
                            }
                        }
                        .pickerStyle(.wheel)
                        .accessibilityLabel("Indicate stance")
                        .accessibilityHint("Scroll up or down to change how much you agree or disagree.")
                        
                    } //End of HStack
                    
                    VStack {
                        Button("Next Question") { addQuestion() }
                        //Add action + disabled if no answer picked
                            .buttonStyle(.borderedProminent)
                            .disabled(disableIncrement)
                        
                        Spacer()
                        
                        NavigationLink(destination: PoliticalStance()) {
                            Text("Calculate")
                                .fontWeight(showResults ? .light : .bold)
                                .frame(width: 90, height: 35)
                                .background(showResults ? .gray : .blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }.disabled(showResults)
                    }
                    
                    Spacer(); Spacer(); Spacer();
                    
                } //End of VStack
                .navigationTitle("Political Spectrum Test")
            } //End of NV
        }
    }
    
    func addQuestion() {
        
        //Increment Question and Index
        if currentQuestion <= 14 {
            currentQuestion += 1
            currentIndex += 1
        }
        
        let position = Information.shared.scaleName.firstIndex{$0 == userChoice} ?? 0
        totalPoints += (Information.shared.scaleValue[position])
        
        if currentQuestion == 15 {
            doneTest = true
        }
        
        if doneTest == true {
            totalPoints += (Information.shared.scaleValue[position])
            users.first?.politicalStance = Int16((totalPoints / 15))
            disableIncrement = true
            showResults = false
            
            try? moc.save()
            //print(users.first?.politicalStance ?? 0)
        }
    }
}

struct PoliticalSpectrum_Previews: PreviewProvider {
    static var previews: some View {
        PoliticalSpectrum()
    }
}
