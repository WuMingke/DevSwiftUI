//
//  Animation2.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/21.
//

import SwiftUI

struct Animation2: View {
    @State var isOpen = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(isOpen ? Color.yellow : Color.red)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .cornerRadius(32)

            Image(systemName: "flame.fill")
                .font(.system(size: isOpen ? 68 : 48))
                .foregroundColor(isOpen ? .red : .yellow)
        }
        .onTapGesture {
            /// 显式动画
            withAnimation(.spring()) {
                isOpen.toggle()
            }
        }
    }
}

#Preview {
    Animation2()
}
