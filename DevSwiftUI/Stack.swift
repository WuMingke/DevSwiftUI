//
//  SwiftUIStack.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/13.
//

import SwiftUI

struct SwiftUIStack: View {
    var body: some View {
        ZStack {
            Image("startup")
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .scaledToFill() // 等同
                .edgesIgnoringSafeArea(.all) // 忽略安全区
            VStack {
                Spacer() // 占位
                HStack(alignment: .center, spacing: 20) {
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .clipShape(Circle())
                    Text("夜空鱼")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

struct SwiftUIStack_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStack()
    }
}
