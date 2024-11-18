//
//  Gesture3.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

/// 缩放
/// 按住option键预览
struct Gesture3: View {
    @GestureState private var scalingRatio = CGFloat(1.0)
    @State private var lastRatio = CGFloat(1.0)
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(lastRatio * scalingRatio)
            .gesture(
                MagnificationGesture()
                    .updating($scalingRatio, body: { currentState, state, _ in
                        state = currentState
                    })
                    .onEnded { value in
                        lastRatio *= value
                    }
            )
    }
}

#Preview {
    Gesture3()
}
