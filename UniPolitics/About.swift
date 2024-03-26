//
//  About.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/19/23.
//

import SwiftUI

struct About: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Version 1.1.1")
                        .foregroundColor(.gray)
                } header: {
                    Text("Software")
                }
                
                Section {
                    Text("Hello, There!\n\nMy name is Sarah and I am the brander, designer, and programmer of this application.\n\nWhen I first learned about politics and coding, I found that I can combine the two and create a small application that is used for a multitude of things.\n\nI hope you are or have been enjoying this app and its tests, learning articles, and sharing features!")
                        .foregroundColor(.black)
                } header: {
                    Text("About the Author")
                }
                
                Section {
                    Text("Copyright 2023 Katerina Limpitsouni\nPhoto by Element5 Digital on Unsplash\nPhoto by Kelly Sikkema on Unsplash\nPhoto by Anthony Garand on Unsplash\nPhoto by Andy Feliciotti on Unsplash\nrobin bird by Jino from Noun Project (CCBY3.0)")
                        .font(.caption)
                } header: {
                    Text("Image Credits")
                }
                
                Section {
                    Text("Email - irvy1786@gmail.com\nTwitter - @meta_oculus")
                        .foregroundColor(.black)
                } header: {
                    Text("Contact")
                }
            }
            .navigationTitle("About")
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
