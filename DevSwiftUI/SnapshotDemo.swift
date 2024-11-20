//
//  SnapshotDemo.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct SnapshotDemo: View {
    @State private var uiImage: UIImage?
    @State private var showShareSheet = false
    var body: some View {
        VStack {
            imageCard
                // 单击 双击 同时存在时，需要额外的处理
                .onTapGesture {
                    /// 1 截图
                    uiImage = imageCard.snapshot()
                    /// 2 保存
//                    let imageSaver = ImageSaver()
//                    imageSaver.writeToPhotoAlbum(image: imageCard.snapshot()!)

                    /// 3 分享
                    showShareSheet.toggle()
                }
                .sheet(isPresented: $showShareSheet, content: {
                    ShareSheet(items: uiImage as Any)
                })
            // snapshot() 不能立马完成，所以直接使用展示不出来
            if uiImage != nil {
                Image(uiImage: imageCard.snapshot()!)
            }
        }
    }

    private var imageCard: some View {
        ZStack {
            Image("avatar")
                .resizable()
//                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(16)
                .overlay {
                    Text("覆盖在上面的文本")
                        .foregroundColor(.yellow)
                }
        }
    }
}

#Preview {
    SnapshotDemo()
}
