//
//  Welcome.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/13/23.
//

import SwiftUI

struct Welcome: View {
    
    @Binding var isLoggedOut: Bool
    @Binding var isSignedIn: Bool
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        .accessibilityLabel("Home Screen")
                        .accessibilityAddTraits(.isButton)
                }
            
            Learning()
                .tabItem {
                    Label("Learn", systemImage: "graduationcap.fill")
                        .accessibilityLabel("Learn Politics")
                        .accessibilityAddTraits(.isButton)
                }
            
            PoliticalSpectrum()
                .tabItem {
                    Label("Stance", systemImage: "hands.sparkles.fill")
                        .accessibilityLabel("Political Stance Quiz")
                        .accessibilityAddTraits(.isButton)
                }
            
            Prediction()
                .tabItem {
                    Label("Predict", systemImage: "brain.head.profile")
                        .accessibilityLabel("Predict Political Stance")
                        .accessibilityAddTraits(.isButton)
                }
            
            Settings(isSignedIn: $isSignedIn, isLoggedOut: $isLoggedOut)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                        .accessibilityLabel("Settings")
                        .accessibilityAddTraits(.isButton)
                }
            
//            Friends()
//                .tabItem {
//                    Label("Friends", systemImage: "person.3")
//                        .accessibilityLabel("View Friends")
//                        .accessibilityAddTraits(.isButton)
//                }
            
            //Add Profile Tab
        }
    }
}

//struct Welcome_Previews: PreviewProvider {
//    static var previews: some View {
//        Welcome(isLoggedOut: $isLoggedOut, isSignedIn: $isSignedIn)
//    }
//}
