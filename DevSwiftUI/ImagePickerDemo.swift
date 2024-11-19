//
//  ImagePickerDemo.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct ImagePickerDemo: View {
    @State var selectImage: Image?
    @State private var showImagePicker = false

    /// 相机需要真机，默认相册
//    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        VStack {
            if selectImage != nil {
                selectImage?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color(.systemGray3))
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
            }
        }
        .onTapGesture {
            showImagePicker.toggle()
        }

        /// 怎么没有弹出权限？？
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: $selectImage, sourceType: sourceType)
        })
    }
}

#Preview {
    ImagePickerDemo()
}
