//
//  Color.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

struct ColorDemo: View {
//    private var imageColor: Color = .red
    /// 使用在 Assets 中定义的颜色
    private var imageColor: Color = .init("imageColor")
    private var textColor: Color = .green
    var body: some View {
        VStack(spacing: 40) {
            
            Image(systemName: "heart.fill")
                .foregroundColor(imageColor)
            
            Text("云深不知处")
                .foregroundColor(textColor)
                .padding()
                .background(imageColor)
                /// 用 overlay 实现边框
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 48)
                        .stroke(.black, lineWidth: 1)
                })
            Text("云深不知处")
                .padding()
                /// 用 overlay 实现边框
                .overlay(content: {
                    Capsule(style: .continuous)
                        .stroke(.black, style: StrokeStyle(lineWidth: 2, dash: [10]))
                })

            Text("云深不知处")
                .padding()
                /// 渐变
                .background(
                    LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .topTrailing)
                )

            Text("云深不知处")
                .padding()
                /// 自定义扩展函数 支持十六进制颜色
                .background(
                    Color(hex: "#8fd3f4")
                )
        }
    }
}

#Preview {
    ColorDemo()
}
