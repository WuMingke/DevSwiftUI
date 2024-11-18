//
//  Gesture4.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

/// 旋转
/// 按住option键预览
struct Gesture4: View {
    @State private var lastAngle = Angle(degrees: 0.0)
    @GestureState private var lastAngle2 = Angle(degrees: 0.0)
    var body: some View {
        Text("Hello, World!")
            .rotationEffect(lastAngle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        self.lastAngle = value
                    }
                /// 旋转不会走 updating
//                    .updating($lastAngle2, body: { currentState, state, _ in
//                        state = currentState
//
//                    })
//                    .onEnded { value in
//
//                        self.lastAngle = value
//                    }
            )
    }
}

#Preview {
    Gesture4()
}
