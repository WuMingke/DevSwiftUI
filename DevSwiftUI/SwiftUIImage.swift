//
//  SwiftUIImage.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/13.
//

import SwiftUI

struct SwiftUIImage: View {
    var body: some View {
        VStack {
            ZStack {
                Image("avatar")
                    .resizable() // 允许拉伸
                    .scaledToFit() // 等比缩放
                    .frame(width: 200) // 尺寸修饰符
                    //            .cornerRadius(16)  // 圆角
                    .clipShape(Circle()) // 裁剪
                    .opacity(0.8) // 透明度

                Image("scene")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .blendMode(.color) // 混合模式
            }
            Image(systemName: "square.and.arrow.up") // 图标库,文字和图片的属性都可以用
                .font(.system(size: 100)) // 这样设置尺寸
                .foregroundColor(.red) // 颜色
                .padding(20)
                .background(Color(.systemGray5))
                .clipShape(Circle())

            /// 网络图片
            let imgUrl = "https://iknow-pic.cdn.bcebos.com/77c6a7efce1b9d16065d2efce1deb48f8d546491"
            AsyncImage(url: URL(string: imgUrl)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .cornerRadius(16)

            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct SwiftUIImage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImage()
    }
}
