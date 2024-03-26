//
//  LearnIdeology.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/18/23.
//

import SwiftUI

struct LearnIdeology: View {
    
    //Passed Value
    @State private var choosenTopic = 0

    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                    Image(decorative: "Stances")
                        .resizable()
                        .scaledToFit()
                    }
                    
                    Text("Between liberalism and conservatism, there are a plethora of topics that each are prone to siding with. Often, these ideologies are not concrete, but a generalized opinion set that characterize each side of the spectrum. You may find that you support some ideas more than others, and that's perfect!")
                        .padding(10)
                        .font(.headline)
                        .frame(width: 350)
                
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("Choose a Topic")
                            .font(.title3)
                            .bold()
                        
                        Picker("", selection: $choosenTopic) {
                            ForEach(0..<6) { topic in
                                Text("\(Information.shared.learnTopics[topic])")
                            }
                        }
                        
                        NavigationLink(destination: LearnTopic(choosenTopic: $choosenTopic)) {
                            Text("Next")
                                .fontWeight(.regular)
                                .frame(width: 60, height: 35)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    
                    HStack {
                        Text("Note:")
                            .frame(width: 50, height: 20)
                            .background(.gray)
                            .cornerRadius(10)
                            .font(.caption)
                            .foregroundColor(.white)
                        
                        Text("UniPolitics does not endorse any of the following stances. These are presented for educational purposes.")
                            .padding(10)
                            .font(.caption)
                            .frame(width: 250)
                    }
            }
        }
    }
}

struct LearnIdeology_Previews: PreviewProvider {
    static var previews: some View {
        LearnIdeology()
    }
}
