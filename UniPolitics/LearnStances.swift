//
//  LearnStances.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/18/23.
//

import SwiftUI

struct LearnStances: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack (alignment: .leading) {
                        Text("5-10 minute read")
                            .frame(width: 130, height: 20)
                            .background(.gray)
                            .cornerRadius(10)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    
                    ForEach (0..<4) { type in
                        Text(Information.shared.types[type])
                            .frame(width: 200, height: 30)
                            .background(.blue)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(10)
                        
                        Text(Information.shared.learnTypes[type])
                            .padding([.bottom, .horizontal], 25)
                    }
                }
            }
        }
    }
}

struct LearnStances_Previews: PreviewProvider {
    static var previews: some View {
        LearnStances()
    }
}
