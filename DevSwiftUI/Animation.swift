//
//  Animation.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/21.
//

import SwiftUI

struct Animation: View {
    @State var isOpen = false
    var body: some View {
        VStack {
            Image(systemName: isOpen ? "xmark" : "plus")
                .font(.system(size: 24))
                .padding()
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .scaleEffect(isOpen ? 0.8 : 1.0)
                .foregroundColor(isOpen ? .gray : .white)
                .padding()
                .background(Color(isOpen ? .systemGray6 : .systemBlue))
                /// 隐式动画
                //            .animation(.default, value: isOpen)
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3), value: isOpen)
                .onTapGesture {
                    isOpen.toggle()
                }

            /// 给组合添加隐式动画
            ZStack {
                Rectangle()
                    .fill(isOpen ? Color.yellow : Color.red)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .cornerRadius(32)

                Image(systemName: "flame.fill")
                    .font(.system(size: isOpen ? 68 : 48))
                    .foregroundColor(isOpen ? .red : .yellow)
            }
            .animation(.spring(), value: isOpen)
            .onTapGesture {
                isOpen.toggle()
            }
        }
    }
}

#Preview {
    Animation()
}
