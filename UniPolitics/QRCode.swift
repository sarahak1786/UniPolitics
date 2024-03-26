//
//  QRCode.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/12/23.
//

import CoreData
import CoreImage.CIFilterBuiltins
import SwiftUI

struct QRCode: View {
    
    //For Reading FetchData
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    
    //For QRCode
    @State private var name = ""
    @State private var politicalSign = ""
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    //Show Alert
    @State private var showAlert = false
    
    //Disable Change Stance
    @State private var disabledStance = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 350, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .padding(5)
                    
                    TextField("\(Information.shared.codeNames[Int(users.first?.politicalStance ?? 0)])", text: $politicalSign).onAppear() {
                        self.politicalSign = Information.shared.codeNames[Int(users.first?.politicalStance ?? 0)]
                        }
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 350, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                        .padding(5)
                        .disabled(disabledStance)
                    
                        Image(uiImage: qrCode)
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                            .padding(5)
                    
                    Button {
                        let imageSaver = ImageSaver()
                        imageSaver.writeToPhotos(image: qrCode)
                    } label: {
                        Label("Save to Photos", systemImage: "square.and.arrow.down")
                            .accessibilityLabel("Download")
                            .accessibilityHint("Press to automatically save to your gallery")
                    }
                        .fontWeight(.bold)
                        .frame(width: 180, height: 35)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            .navigationTitle("QRCode")
            .onAppear(perform: updateCode)
            .onAppear(perform: getName)
            .onChange(of: name) {_ in updateCode()}
            .onChange(of: politicalSign) {_ in updateCode()}
        }
    }
    func getName() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchLimit = 1

        do {
            let result = try moc.fetch(fetchRequest)
            
            if let user = result.first as? User {
                name = user.name ?? "Anonymous"
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func updateCode() {
        qrCode = userQRCode(from: "\(name)\n\(politicalSign)")
    }
    
    func userQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRCode_Previews: PreviewProvider {
    static var previews: some View {
        QRCode()
    }
}
