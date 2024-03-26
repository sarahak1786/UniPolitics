//
//  ChangeProfile.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/20/23.
//

import CoreData
import SwiftUI

struct ChangeProfile: View {
    
    //Core Data
    @Environment(\.managedObjectContext) var moc
    
    //Dismiss
    @Environment(\.dismiss) var dismiss
    
    //Reading Core Data Variables
    @State private var about = ""
    @State private var password = ""
    
    //Show password
    @State private var showPass = false
    
    //Show saved
    @State private var isSaved = false
    
    //Updated
    @Binding var update: Bool
    
    //Allow Password
    var allowPassword: Bool {
        if (password.trimmingCharacters(in: .whitespacesAndNewlines).count < 8) {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        if showPass {
                            TextField("\(password)", text: $password)
                        } else {
                            SecureField("\(password)", text: $password)
                        }
                        Button("Show Password") { showPass.toggle() }
                    } header: {
                        Text("Password")
                    }
                    
                    Section {
                        TextField("\(about)", text: $about)
                    } header: {
                        Text("Biography")
                    }
                    
                    Section {
                        Button("Save") {
                            save()
                            dismiss()
                        }
                        .disabled(allowPassword == false)
                        .bold()
                        
                    } header: {
                        if allowPassword == false {
                            Text("Password must be 8 characters.")
                        }
                        
                        if isSaved == true {
                            Text("Your changes have been saved.")
                    }
                }
            }
            .navigationBarTitle("Edit Profile")
            .onAppear(perform: fetchUser)
        }
    }
    
    func save() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchLimit = 1

        do {
            let result = try moc.fetch(fetchRequest)
            
            if let user = result.first as? User {
                user.password = password
                user.about = about
            }
            
            update = true
            
            isSaved = true
            try? moc.save()
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchLimit = 1

        do {
            let result = try moc.fetch(fetchRequest)
            
            if let user = result.first as? User {
                password = user.password ?? "Password Not Entered"
                about = user.about ?? "No Biography"
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

//struct ChangeProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeProfile(update:)
//    }
//}
