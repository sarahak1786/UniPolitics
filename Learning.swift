//
//  Learning.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/13/23.
//

import SwiftUI

struct Learning: View {
    
    //For Photo Album
    private let images = 4
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    var controls: some View {
        HStack {
            Button {
                previous()
            } label: {
                Image(systemName: "chevron.left")
                    .accessibilityHidden(true)
            }
            Spacer()
                .frame(width: 80, height: 30)
            
            Button {
                next()
            } label: {
                Image(systemName: "chevron.right")
                    .accessibilityHidden(true)
            }
        } .accentColor(.blue)
    }
    
    //Show Sheets
    @State private var showStances = false
    @State private var showIdeology = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    TabView(selection: $currentIndex) {
                        ForEach(0..<5) { num in
                            Image("\(num)")
                                .resizable()
                                .scaledToFill()
                                .overlay(Color.black.opacity(0.4))
                                .tag(num)
                                .accessibilityHidden(true)
                        }
                    } .tabViewStyle(PageTabViewStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding()
                        .frame(width: proxy.size.width, height: proxy.size.height / 3)
                        .onReceive(timer, perform: { _ in
                            next()
                        })
                    
                    controls
                    
                    NavigationView {
                        ScrollView {
                            VStack(alignment: .leading) {
                                Text("Political Stances in America")
                                    .frame(width: 350, height: 30)
                                    .background(.blue)
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .padding()
                                    .minimumScaleFactor(0.6)
                                
                                Text(Information.shared.sections[0])
                                    .frame(width: 350, height: 65)
                                    .font(.headline)
                                    .padding()
                                    .minimumScaleFactor(0.6)
                                
                                Button("Read Now") {
                                    showStances = true
                                }
                                    .frame(width: 120, height: 30)
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .background(.primary)
                                    .cornerRadius(5)
                                    .padding(10)
                                    .minimumScaleFactor(0.6)
                                
                                Divider()
                                    .padding()
                                
                                Text("Liberals and Conservatives Ideologies")
                                    .frame(width: 350, height: 30)
                                    .background(.blue)
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .padding()
                                    .minimumScaleFactor(0.6)
                                
                                Text(Information.shared.sections[1])
                                    .frame(width: 350, height: 65)
                                    .font(.headline)
                                    .padding()
                                    .minimumScaleFactor(0.6)
                                
                                Button("Read Now") {
                                    showIdeology = true
                                }
                                    .frame(width: 120, height: 30)
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .background(.primary)
                                    .cornerRadius(5)
                                    .padding(10)
                                    .minimumScaleFactor(0.6)
                            }
                            
                            Spacer()
                            Spacer()
                        }
                        .navigationTitle("Topics")
                        .sheet(isPresented: $showStances) {
                            LearnStances()
                        }
                        .sheet(isPresented: $showIdeology) {
                            LearnIdeology()
                        }
                    }
                }
                
                //Political Stances in America
            }
            .navigationBarTitle("Learning Politics")
            
            Spacer()
        }
    }
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : images - 1
        }
    }
    
    func next() {
        withAnimation {
            currentIndex = currentIndex < images ? currentIndex + 1 : 0
        }
    }
}

struct Learning_Previews: PreviewProvider {
    static var previews: some View {
        Learning()
    }
}
