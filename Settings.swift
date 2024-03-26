//
//  Settings.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/19/23.
//

import SwiftUI

struct Settings: View {
    
    //Log Out
    @State private var logOut = false
    
    @Binding var isSignedIn: Bool
    @Binding var isLoggedOut: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: Profile()) {
                        Text("Profile")
                            .accessibilityLabel("Profile Settings")
                    }
                    
                    NavigationLink(destination: Notifications()) {
                        Text("Notifications")
                            .accessibilityLabel("Notification Settings")
                    }
                } header: {
                    Text("General")
                        .accessibilityLabel("General Settings")
                }
                
                Section {
                    NavigationLink(destination: About()) {
                        Text("About")
                            .accessibilityLabel("About Author and App")
                    }
                } header: {
                    Text("Miscellaneous")
                }
                
                Section {
                    Button("Log out", role: .destructive) {
                        logOut = true
                    }
                }
            }
            .navigationBarTitle("Settings")
            .alert("Are you sure?", isPresented: $logOut) {
                Button("Confirm", action: toLogin)
                Button("Cancel") {}
            }
        }
    }
    
    func toLogin() {
        isLoggedOut = true
        isSignedIn = false
        
        Login(isSignedIn: $isSignedIn, isLoggedOut: $isLoggedOut)
    }
}

//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        Settings()
//    }
//}
