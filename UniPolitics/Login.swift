//
//  Login.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/19/23.
//

import SwiftUI
import CoreData

struct Login: View {
    
        //Core Data
        @Environment(\.managedObjectContext) var moc
        
        //Entered Data
        @State private var name = ""
        @State private var password = ""
        @State private var about = ""
        
        //Allow Welcome Page
        @Binding var isSignedIn: Bool
        @Binding var isLoggedOut: Bool
    
        //Wrong Password
        @State private var wrongLogIn = false
    
        //Check if Empty
        var isEmpty: Bool {
            if (name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || (password.trimmingCharacters(in: .whitespacesAndNewlines).count < 8)) {
                return true
            } else {
                return false
            }
        }
        
        var body: some View {
            NavigationView {
                ScrollView {
                VStack {
                    
                    Spacer()
                    Spacer()
                    
                    Image(decorative: "Logo")
                        .resizable()
                        .frame(width: 350, height: 50)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                        .padding()
                    
                    Section {
                        TextField("Name", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.6)
                            .accessibilityHint("Enter your login name.")
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.6)
                            .accessibilityHint("Enter your password.")
                        
                        if wrongLogIn == true {
                            Text("User or password incorrect. Try again.")
                                .font(.caption)
                                .padding()
                        }
                    }
                    
                    Text("Welcome back.")
                        .font(.headline)
                        .minimumScaleFactor(0.6)
                        .accessibilityHidden(true)
                    
                    Button(action: {
                        checkUser()
                    }) {
                        Text("Log in")
                            .fontWeight(.bold)
                            .frame(width: 180, height: 35)
                            .background(isEmpty ? .gray : .blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .minimumScaleFactor(0.6)
                    } .disabled(isEmpty == true)
                    
                    Spacer()
                    Spacer()
                }
                .toolbar {
                    Button {
                        isSignedIn = false
                        isLoggedOut = false
                    } label: {
                        Text("Create New Account")
                            .font(.headline)
                            .shadow(radius: 10)
                            .minimumScaleFactor(0.6)
                            .accessibilityHint("For those who do not have an account.")
                    }
                }
            }
        }
    }
        func checkUser() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
            
            fetchRequest.sortDescriptors = [sortDescriptor]
            fetchRequest.fetchLimit = 1

            do {
                let result = try moc.fetch(fetchRequest)
                
                if let user = result.first as? User {
                    if (name == user.name) && (password == user.password) {
                        isSignedIn = true
                        isLoggedOut = false
                    } else {
                        wrongLogIn = true
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
}

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
