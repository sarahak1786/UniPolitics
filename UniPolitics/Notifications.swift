//
//  Notifications.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/19/23.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    
    //Show Alert
    @State private var showAlert = false
    
    //Show Notifications
    @State private var showLearn = false
    @State private var showPredict = false
    @State private var showTest = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle("Allow Notifications", isOn: $showAlert.animation())
                        .onTapGesture {
                            requestNotification()
                        }
                    
                    if showAlert == true {
                        Button("Learning Notifications") {
                            showLearn.toggle()
                            createLearnNotification()
                        }
                        
                        Button("Predict Notifications") {
                            showPredict.toggle()
                            createPredictNotification()
                        }
                        
                        Button("Test Notifications") {
                            showTest.toggle()
                            createTestNotification()
                        }
                    }
                }
            }
            .navigationBarTitle("Notifications")
        }
    }
    func createLearnNotification() {
        if showLearn == true {
            let content = UNMutableNotificationContent()
            content.title = "Get your learning started!"
            content.subtitle = "Read about ideologies, stances, and more!"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 604800, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
            print("Learn")
        }
    }
    
    func createPredictNotification() {
        if showPredict == true {
            let content = UNMutableNotificationContent()
            content.title = "We Predict Your Stance!"
            content.subtitle = "Enter a few pieces of info and...Voila!"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1296000, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
            print("Predict")
        }
    }
    
    func createTestNotification() {
        if showTest == true {
            let content = UNMutableNotificationContent()
            content.title = "Calling all people!"
            content.subtitle = "Elections are coming up, take our quiz."
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1728000, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)
            print("Test")
        }
    }
    
    func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Ready!")
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
