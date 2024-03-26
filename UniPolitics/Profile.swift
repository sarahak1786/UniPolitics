//
//  Profile.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/19/23.
//

import CoreData
import SwiftUI

struct Profile: View {
    
    //Core Data
    @Environment(\.managedObjectContext) var moc
    
    //Reading Core Data Variables
    @State private var name = ""
    @State private var password = ""
    @State private var about = ""
    
    //Uneditable
    @State private var edit = false //always
    
    //Alerts/Sheets
    @State private var showEdit = false
    @State private var showSheet = false
    
    //Show saved
    @State private var isSaved = false
    
    //Update Profile
    @State private var update = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("\(name)", text: $name)
                        .disabled(edit == false)
                } header: {
                    Text("Name")
                }
                
                Section {
                    SecureField("\(password)", text: $password)
                        .disabled(edit == false)
                } header: {
                    Text("Password")
                }
                
                Section {
                    TextField("\(about)", text: $about)
                        .disabled(edit == false)
                } header: {
                    Text("Biography")
                }
                
                if update == true {
                    Button("You profile has been updated.") { }
                        .font(.headline)
                        .foregroundColor(.black)
                        .disabled(edit == false)
                        .onAppear(perform: fetchUser)
                }
            }
            .navigationBarTitle("Profile")
            .onAppear(perform: fetchUser)
            .toolbar {
                Button {
                    showEdit = true
                } label: {
                    Label("Edit", systemImage: "square.and.pencil")
                        .accessibilityLabel("Edit Profile")
                        .accessibilityHint("You will be able to edit your name and password.")
                }
            }
            .alert("Would you like to edit your profile?", isPresented: $showEdit) {
                Button("Confirm") {
                    showSheet = true
                }
                Button("Cancel") {
                    showSheet = false
                    update = false
                }
            }
            .sheet(isPresented: $showSheet) {
                ChangeProfile(update: $update)
            }
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
                name = user.name ?? "Anonymous"
                password = user.password ?? "Password Not Entered"
                about = user.about ?? "No Biography"
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
