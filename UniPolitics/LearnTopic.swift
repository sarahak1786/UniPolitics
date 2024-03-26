//
//  LearnTopic.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/18/23.
//

import SwiftUI

struct LearnTopic: View {
    
    @Binding var choosenTopic: Int
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("\(Information.shared.learnTopics[choosenTopic])")
                        .font(.title)
                        .bold()
                        .shadow(radius: 10)
                    
                    VStack (alignment: .leading) {
                        Text("3-7 minute read")
                            .frame(width: 130, height: 20)
                            .background(.gray)
                            .cornerRadius(10)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    
                    Text("Left Stance")
                        .frame(width: 200, height: 30)
                        .background(.blue)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                    
                    Text(Information.shared.learnLeft[choosenTopic])
                        .padding([.bottom, .horizontal], 25)
                    
                    Divider()
                        .padding()
                    
                    Text("Right Stance")
                        .frame(width: 200, height: 30)
                        .background(.blue)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .cornerRadius(10)
                    
                    Text(Information.shared.learnRight[choosenTopic])
                        .padding([.bottom, .horizontal], 25)
                }
            }
        }
    }
}

//struct LearnTopic_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnTopic()
//    }
//}
