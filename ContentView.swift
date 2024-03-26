//
//  ContentView.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/11/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    //Core Data
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    
    //Signed In Condition
    @State private var isSignedIn = false
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationView {
            if (isLoggedOut == false) && (isSignedIn == true) {
                withAnimation {
                    Welcome(isLoggedOut: $isLoggedOut, isSignedIn: $isSignedIn)
                }
                
            } else if (isLoggedOut == true) && (isSignedIn == false) {
                withAnimation {
                    Login(isSignedIn: $isSignedIn, isLoggedOut: $isLoggedOut)
                }
                
            } else if (isLoggedOut == false) && (isSignedIn == false) {
                withAnimation {
                    AddUser(isSignedIn: $isSignedIn, isLoggedOut: $isLoggedOut)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
