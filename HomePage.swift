//
//  HomePage.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/13/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                    .padding()
                
                HStack {
                    Image(systemName: "graduationcap.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 60)
                        .padding()
                        .accessibilityHidden(true)
                    
                    Text("Begin learning all about political stances with our 'Learn' section designed for beginners!")
                        .font(.title3)
                        .padding()
                }
                
                Divider()
                    .padding()
                
                HStack {
                    Text("Wondering about **your** political stance? Take our short, 5-minute quiz to get your spirit animal and learn about the political spectrum!")
                        .font(.title3)
                        .padding()
                    
                    Image(systemName: "hands.sparkles.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 60)
                        .padding()
                        .accessibilityHidden(true)
                }
                
                Divider()
                    .padding()
                
                HStack {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 60, height: 70)
                        .padding()
                        .accessibilityHidden(true)
                    
                    Text("What us to predict your political stance? It's on a Democrat, Republican, and Independent scale, so there's no cheating!")
                        .font(.title3)
                        .padding()
                }
                
                Divider()
                    .padding()
                
                HStack {
                    Text("Take our quiz and save your unique QR code to share with friends! You can review your friends' stance as well by scanning their code.")
                        .font(.title3)
                        .padding()
                    
                    Image(systemName: "person.3")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 90, height: 50)
                        .padding()
                        .accessibilityHidden(true)
                }
                
            }
            .navigationTitle("Welcome!")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
