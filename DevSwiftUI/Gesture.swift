//
//  Gesture.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

/// 点击
struct GestureDemo: View {
    @State private var number = 0
    @State private var numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @State private var isLongPressGesture = false
    @GestureState private var isStateLongPressGesture = false
    var body: some View {
        VStack(spacing: 10) {
            Text(String(number))
                .font(.title)
            Text("换一换")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .frame(width: 120, height: 48)
                .background(.green)
                .cornerRadius(8)
                /// 点击
                .onTapGesture {
                    /// 创建一个随机副本
                    numberArray = numberArray.shuffled()
                    number = numberArray[0]
                }
            Text("换一换")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .frame(width: 120, height: 48)
                .background(.green)
                .cornerRadius(8)
                /// 手势识别
                .gesture(
                    TapGesture()
                        .onEnded {
                            numberArray = numberArray.shuffled()
                            number = numberArray[0]
                        }
                )
            
            // @State
            Image(systemName: "heart.fill")
                .font(.system(size: isLongPressGesture ? 38 : 32))
                .foregroundColor(isLongPressGesture ? .red : .gray)
                .frame(width: 100, height: 100)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .scaleEffect(isLongPressGesture ? 1.2 : 1.0)
                /// 长按
                .onLongPressGesture(
                    minimumDuration: 1.0,
                    perform: {
                        self.isLongPressGesture.toggle()
                    }
                )

            // @GestureState
            Image(systemName: "heart.fill")
                .font(.system(size: isStateLongPressGesture ? 38 : 32))
                .foregroundColor(isStateLongPressGesture ? .red : .gray)
                .frame(width: 100, height: 100)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .scaleEffect(isStateLongPressGesture ? 1.2 : 1.0)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .updating($isStateLongPressGesture, body: { currentState, state, _ in
                            state = currentState
                        })
                        .onEnded { _ in }
                )
        }
    }
}

#Preview {
    GestureDemo()
}
