//
//  Graphics2.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct Graphics2: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 300, y: 20))
                path.addLine(to: CGPoint(x: 300, y: 200))
                path.addLine(to: CGPoint(x: 20, y: 200))
                path.closeSubpath()
            }
            .stroke(.yellow, lineWidth: 3)

            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                let endPoint = CGPoint(x: 250, y: 50)
                let controlPoint = CGPoint(x: 150, y: 150)
                /// 贝塞尔曲线
                path.addQuadCurve(to: endPoint, control: controlPoint)
            }
            .stroke(.red, lineWidth: 3)

            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                let endPoint = CGPoint(x: 250, y: 50)
                let controlPoint1 = CGPoint(x: 150, y: 150)
                let controlPoint2 = CGPoint(x: 150, y: -50)
                /// 二阶贝塞尔曲线
                path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)
            }
            .stroke(.red, lineWidth: 3)
        }
    }
}

#Preview {
    Graphics2()
}
