//
//  AddUser.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/12/23.
//

import CoreData
import SwiftUI

struct AddUser: View {
    
    //Core Data
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    
    //Dismiss Sheet
    @Environment(\.dismiss) var dismiss
    
    //Entered Data
    @State private var name = ""
    @State private var password = ""
    @State private var about = ""
    
    //Validate
    @State private var repassword = ""
    
    //Allow Welcome Page
    @Binding var isSignedIn: Bool
    @Binding var isLoggedOut: Bool
    
    //Disable
    var allowName: Bool {
        if (name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return false
        } else {
            return true
        }
    }
    
    var allowPassword: Bool {
        if (password.trimmingCharacters(in: .whitespacesAndNewlines).count < 8) {
            return false
        } else {
            return true
        }
    }
    
    var goodPassword: Bool {
        if (password != repassword) {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Spacer()
                    
                    Image(decorative: "Logo")
                        .resizable()
                        .frame(width: 350, height: 50)
                        .scaledToFit()
                        .padding()
                    
                    Section {
                        TextField("Name", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.6)
                            .accessibilityHint("Enter your name for future logins.")
                        
                        if allowName == false {
                            Text("Name must not be empty.")
                                .font(.caption)
                                .minimumScaleFactor(0.6)
                        }
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.6)
                            .accessibilityHint("Create a password with 8 characters.")
                        
                        if allowPassword == false {
                            Text("Password must be 8 characters/numbers and no spaces.")
                                .font(.caption)
                                .minimumScaleFactor(0.6)
                        }
                        
                        if allowPassword == true {
                            SecureField("Re-enter Password", text: $repassword)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 350, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                                .minimumScaleFactor(0.6)
                            
                            if goodPassword == false {
                                Text("Passwords must match.")
                                    .font(.caption)
                                    .minimumScaleFactor(0.6)
                            }
                        }
                        
                        TextField("Tell us a little about yourself!", text: $about)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .padding()
                            .minimumScaleFactor(0.6)
                        
                        
                        Text("And that's it!")
                            .font(.headline)
                            .minimumScaleFactor(0.6)
                            .accessibilityHidden(true)
                        
                        Button(action: {
                            self.login()
                            self.isSignedIn = true
                            self.isLoggedOut = false
                        }) {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .frame(width: 180, height: 35)
                                .background((allowPassword && allowName && goodPassword) ? .blue : .gray)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .minimumScaleFactor(0.6)
                        }
                        .disabled(allowPassword == false)
                        .disabled(allowName == false)
                        .disabled(goodPassword == false)
                        
                        Spacer()
                        Spacer()
                    }
                }
                .toolbar {
                    Button {
                        isSignedIn = false
                        isLoggedOut = true
                    } label: {
                        Text("Log In")
                            .font(.headline)
                            .shadow(radius: 10)
                            .minimumScaleFactor(0.6)
                            .accessibilityHint("For those who have an account.")
                    }
                }
            }
        }
    }
    
    func login() {
        let user = User(context: moc)
        user.id = UUID()
        user.name = name
        user.password = password
        user.about = about
        user.politicalStance = 0
        user.createdAt = Date()
        
        try? moc.save()
        dismiss()
    }
    
//    func clearData() {
//        for user in users {
//            context.delete(user)
//        }
//    }
}

//struct AddUser_Previews: PreviewProvider {
//    static var previews: some View {
//        AddUser(isSignedIn: isSignedIn)
//    }
//}
