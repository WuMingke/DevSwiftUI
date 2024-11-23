//
//  Animation4.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/22.
//

import SwiftUI

struct Animation4: View {
    @State private var isLoading = false
    var body: some View {
        HStack {
            ForEach(0 ..< 4) { index in
                Circle()
                    .fill(.green)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isLoading ? 1.0 : 0.5)
                    .animation(.easeInOut(duration: 0.5)
                        .repeatForever()
                        .delay(Double(index) * 0.2), value: isLoading)
            }
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}

#Preview {
    Animation4()
}
