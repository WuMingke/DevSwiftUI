//
//  ImagePicker.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    /// 接收选择的图片
    @Binding var image: Image?

    /// 处理 UIImagePickerController 和 SwiftUI 之间的通信
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var presentationMode: PresentationMode
        @Binding var image: Image?

        init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
            /// 这是什么语法？？？
            _presentationMode = presentationMode
            _image = image
        }

        /// 这是重写的方法   快捷键是什么？？
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            image = Image(uiImage: uiImage)
            presentationMode.dismiss()
        }

        /// 这是重写的方法
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
    }

    /// 这是重写的方法
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, image: $image)
    }

    /// 这是重写的方法
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    /// 这是重写的方法
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
