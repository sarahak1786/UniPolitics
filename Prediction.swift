//
//  Prediction.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/13/23.
//

import CoreML
import SwiftUI

struct Prediction: View {
    
    //Picker Placeholders
    @State private var age = 0
    @State private var education = ""
    @State private var gender = ""
    
    //Political Stance
    @State private var predictedStance = ""
    
    //Sheet
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Picker("Age", selection: $age) {
                        ForEach(5..<106) { age in
                            Text("\(age)")
                        }
                    }
                }
        
                VStack (alignment: .leading, spacing: 0) {
                    Picker("Education Level", selection: $education) {
                        ForEach(Information.shared.education, id: \.self) { educationLevel in
                            Text("\(educationLevel)")
                        }
                    }
                }
            
                VStack (alignment: .leading, spacing: 0) {
                    Picker("Gender", selection: $gender) {
                        ForEach(Information.shared.gender, id: \.self) { gender in
                            Text("\(gender)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Button("Calculate") {
                        calculateStance()
                        showingSheet = true
                    }
                    //Disable if gender empty
                }
            }
            .navigationTitle("Stance Prediction")
            .sheet(isPresented: $showingSheet) {
                PredictionStance(predictedStance: $predictedStance)
            }
        }
    }
    
    func calculateStance() {
        do {
            let config = MLModelConfiguration()
            let model = try StanceCalculator(configuration: config)
            
            let educationIndex = (Information.shared.education.firstIndex(of: education) ?? 0)
            
            let genderIndex = Information.shared.gender.firstIndex(of: gender) ?? 0
            
            let prediction = try model.prediction(age: Double(age), education: Double(educationIndex), gender: Double(genderIndex))
            
            predictedStance = Information.shared.stance[Int(round(prediction.politicalStance))]
            print(predictedStance)
            
        } catch {
            print("Error with calculating stance: \(error.localizedDescription)")
        }
    }
}

struct Prediction_Previews: PreviewProvider {
    static var previews: some View {
        Prediction()
    }
}
