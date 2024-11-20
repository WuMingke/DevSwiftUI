//
//  ImageSaver.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/20.
//

import SwiftUI

// 保存UIImage到相册
class ImageSaver: NSObject {
    var successHandler: (()->Void)?
    var erroeHandler: ((Error)->Void)?

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            erroeHandler?(error)
        } else {
            successHandler?()
        }
    }
}
