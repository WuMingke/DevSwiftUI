//
//  Gesture5.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

// 手势组合
// 避免冲突，处理手势的方式
// 1 同时进行 Simultaneous
// 2 顺序进行 Sequenced
// 3 互斥进行 Exclusive
struct Gesture5: View {
    @GestureState private var scalingRatio = CGFloat(1.0)
    @State private var lastRatio = CGFloat(1.0)
    @State private var lastAngle = Angle(degrees: 0.0)

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .scaleEffect(scalingRatio * lastRatio)
            .rotationEffect(lastAngle)
            .gesture(
                /// 同时进行
                magnificationGesture.simultaneously(with: rotationGesture)
                /// 顺序进行
//                rotationGesture.sequenced(before: magnificationGesture)
                /// 互斥进行
//                rotationGesture.exclusively(before: magnificationGesture)
            )
    }

    private var magnificationGesture: some Gesture {
        MagnificationGesture()
            .updating($scalingRatio, body: { currentState, state, _ in
                state = currentState
            })
            .onEnded { value in
                lastRatio *= value
            }
    }

    private var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { value in
                self.lastAngle = value
            }
    }
}

#Preview {
    Gesture5()
}
