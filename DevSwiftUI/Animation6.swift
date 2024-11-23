//
//  Animation6.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/23.
//

import SwiftUI

struct Animation6: View {
    @State private var isSelected: Bool = false
    var body: some View {
        Rectangle()
            .fill(isSelected ? .green : .black)
            .frame(width: 200, height: 300)
            .cornerRadius(16)
            .rotation3DEffect(
                .degrees(isSelected ? 180 : 0),
                axis: (x: 1.0, y: 1.0, z: 0.0)
            )
            .onTapGesture {
                withAnimation(.linear(duration: 0.4)) {
                    isSelected.toggle()
                }
            }
    }
}

#Preview {
    Animation6()
}
