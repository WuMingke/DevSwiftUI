//
//  SwiftUIText.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/13.
//

import SwiftUI

struct SwiftUIText: View {
    var body: some View {
        VStack {
            Text("看见更大的世界！看见更大的世界！")
                .font(.system(size: 25))
                .foregroundColor(.red)
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
                .padding(20)
                .tracking(5) // 字间距
                .border(Color.blue, width: 5)
                //            .blur(radius: 3)//模糊
//                .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0)) // 旋转
            
        }
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
