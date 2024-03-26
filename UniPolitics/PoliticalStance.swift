//
//  PoliticalStance.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/11/23.
//

import CoreData
import SwiftUI

struct PoliticalStance: View {
    
    
    //Core Data
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    
    //Showing QRCode Sheet
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Spacer()
                    Text("You are part of the...")
                        .font(.headline)
                    
                    Text("\(Information.shared.codeNames[Int(users.first?.politicalStance ?? 0)])")
                            .font(.title.bold())
                            .foregroundStyle(LinearGradient(colors: [.red, .purple, .blue], startPoint: .leading, endPoint: .trailing))
                            .shadow(radius: 10)
                    
                    Spacer()
                    Image(decorative: Information.shared.codeNames[Int(users.first?.politicalStance ?? 0)])
                        .resizable()
                        .frame(width: 350, height: 350)
                        .scaledToFit()
                    
                    Text("\(Information.shared.description[Int(users.first?.politicalStance ?? 0)])")
                        .padding(10)
                        .font(.headline)
                        .frame(width: 350)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Button("Share with a friend!") {
                        showSheet.toggle()
                    }
                        .fontWeight(.bold)
                        .frame(width: 180, height: 35)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .accessibilityHint("This will create a QR Code that can be downloaded.")
                    
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            QRCode()
        }
    }
}

struct PoliticalStance_Previews: PreviewProvider {
    static var previews: some View {
        PoliticalStance()
    }
}
