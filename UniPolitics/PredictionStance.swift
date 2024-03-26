//
//  PredictionStance.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/18/23.
//

import SwiftUI

struct PredictionStance: View {
    
    @Binding var predictedStance: String
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("You align closely to...")
                        .font(.headline)
                    
                    Text(predictedStance)
                        .font(.title.bold())
                        .foregroundStyle(LinearGradient(colors: [.red, .purple, .blue], startPoint: .leading, endPoint: .trailing))
                        .shadow(radius: 10)
                    
                    Spacer()
                    Image(decorative: predictedStance)
                        .resizable()
                        .frame(width: 350, height: 350)
                        .scaledToFit()
                    
                    Text("\(Information.shared.stanceDescription[Int(Information.shared.stance.firstIndex(of: predictedStance) ?? 0)])")
                        .padding(10)
                        .font(.headline)
                        .frame(width: 350)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
            }
        }
    }
}

//struct PredictionStance_Previews: PreviewProvider {
//    static var previews: some View {
//        PredictionStance()
//    }
//}
