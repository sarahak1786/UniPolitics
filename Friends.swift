//
//  Friends.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/12/23.
//

import CodeScanner
import CoreData
import SwiftUI
import UIKit

struct Friends: View {
    
    /*
    //Core Data for Friend
    @FetchRequest(entity: Friend.entity(), sortDescriptors: []) var friends: FetchedResults<Friend>
    @Environment(\.managedObjectContext) var mocFriends
    
    //Code Scanner
    @State private var isShowingScanner = false
    
    //Remove Friends
    @State private var confirmation = false
    
    //Updated
    @State private var showUpdate = false
    */
    
    var body: some View {
        NavigationView {
            /*
            List {
                ForEach(friends.reversed()) { friend in
                    VStack(alignment: .leading) {
                        Text(friend.name ?? "Anonymous")
                            .font(.headline)
                        Text(Information.shared.codeNames[Int(friend.politicalStance)] )
                            .foregroundColor(.secondary)
                    }
                }
                
                Section {
                    Button("Remove All Friends") {
                        confirmation = true
                    }
                    .bold()
                } header: {
                    if showUpdate == true {
                        Text("Friends have been removed.")
                    }
                }
            }
            .navigationTitle("Friends List")
            .toolbar {
                Button {
                    isShowingScanner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
            }
            .alert("Are you sure?", isPresented: $confirmation) {
                Button("Confirm", role: .destructive) {
                    deleteFriends()
                }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func deleteFriends() {
            let fetchRequest: NSFetchRequest<Friend> = Friend.fetchRequest()
            if let objectToDelete = try? fetchRequest.execute().first {
                mocFriends.delete(objectToDelete)
            }
                
                try? mocFriends.save()
        }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else {return}
            
            let newFriend = Friend(context: mocFriends)
            newFriend.name = details[0]
            newFriend.politicalStance = Int16(Information.shared.codeNames.firstIndex(of: details[1]) ?? 0)
            //Adding Date in Order to Delete Later
            
            try? mocFriends.save()
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
             */
        }
    }
}

struct Friends_Previews: PreviewProvider {
    static var previews: some View {
        Friends()
    }
}
