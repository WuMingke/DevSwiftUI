//
//  ColorToString.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

extension Color {
    var uiColor: UIColor { .init(self) }
    typealias RGBA = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    var rgba: RGBA? {
        var (r, g, b, a): RGBA = (0, 0, 0, 0)
        return uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) ? (r, g, b, a) : nil
    }

    var colorToString: String? {
        guard let rgba = rgba else { return nil }
        return String(format: "0x%02X%02X%02X",
                      Int(rgba.red*255),
                      Int(rgba.green*255),
                      Int(rgba.blue*255))
    }
}
