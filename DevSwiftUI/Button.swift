//
//  SwiftUIButton.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/14.
//

import SwiftUI

struct SwiftUIButton: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("立即使用")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 180)
                    //                .background(.green)
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)) // 渐变
                    .cornerRadius(16)

                /**
                 .leading 左边
                 .trailing 右边
                 .top 上边
                 .bottom 下边
                 */
            }

            WoodenFish()

            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .onTapGesture { // 点击操作符
                    print("onTapGesture")
                }
        }
    }
}

struct WoodenFish: View {
    @State var totalNum: Int = 1 // 状态管理
    var body: some View {
        Button(action: {
            totalNum += 1
        }) {
            VStack(spacing: 32) {
                Text("功德：" + String(totalNum))
                    .font(.system(size: 20))
                    .foregroundColor(.black)

                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
        }
    }
}

struct SwiftUIButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButton()
    }
}
