//
//  Animation5.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/23.
//

import SwiftUI

struct Animation5: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 8)
                .frame(width: 48, height: 48)
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color.green, lineWidth: 4)
                .frame(width: 48, height: 48)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.6)
                    .repeatForever(autoreverses: false), value: isLoading)
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}

#Preview {
    Animation5()
}
