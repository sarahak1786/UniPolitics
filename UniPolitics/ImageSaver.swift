//
//  ImageSaver.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/13/23.
//

import UIKit

class ImageSaver: NSObject {
    var successHandle: (() -> Void)?
    var errorHandle: ((Error) -> Void)?
    
    func writeToPhotos(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveComplete), nil)
    }
    
    @objc func saveComplete(_ image: UIImage, didFinishSaveWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandle?(error)
        } else {
            successHandle?()
        }
    }
}
