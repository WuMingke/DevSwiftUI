//
//  Gesture2.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

/// 托拽
struct Gesture2: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    var body: some View {
        Text("Hello, World!")
            .font(.system(size: 20))
            .offset(x: dragOffset.width + position.width,
                    y: dragOffset.height + position.height)
            .animation(.easeInOut, value: dragOffset)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, _ in
                        state = value.translation
                    })
                    .onEnded { value in
                        self.position.width += value.translation.width
                        self.position.height += value.translation.height
                    }
            )
    }
}

#Preview {
    Gesture2()
}
