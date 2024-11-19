//
//  Graphics.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct Graphics: View {
    var body: some View {
        VStack {
            Circle()
                //            .fill(.green)
                .stroke(.green, lineWidth: 2)
                .frame(width: 100)

            Ellipse()
                .fill(.red)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)

            Rectangle()
//                .fill(.blue)
                .strokeBorder(.blue, style: StrokeStyle(lineWidth: 4, dash: [10]))
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)

            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.yellow)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)

            Capsule()
                .fill(.brown)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20)
        }
    }
}

#Preview {
    Graphics()
}
