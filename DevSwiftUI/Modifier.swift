//
//  Modifier.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/20.
//

import SwiftUI

struct Modifier: View {
    var body: some View {
        VStack {
            Text("1")
                .modifier(TextBtnModifier())
            Text("2")
                .modifier(TextBtnModifier())
            Text("3")
                .customBtnModidier()
        }
    }
}

/// 利用扩展函数，直接使用创建后的modifier
extension View {
    func customBtnModidier() -> some View {
        modifier(TextBtnModifier())
    }
}

/// 使用 .modifier
struct TextBtnModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
            })
            .padding(.horizontal)
    }
}

#Preview {
    Text("Hello, world!")
        .modifier(TextBtnModifier())
}

#Preview {
    Modifier()
}
