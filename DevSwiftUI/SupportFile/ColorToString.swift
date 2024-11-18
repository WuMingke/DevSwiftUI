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

    /// 支持十六进制颜色
    init(hex: String) {
            var sanitizedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // 确保字符串以 "#" 开头
            guard sanitizedHex.hasPrefix("#") else {
                self = .clear // 无效输入，返回透明颜色
                return
            }
            
            // 移除 "#" 前缀
            sanitizedHex.removeFirst()
            
            var hexNumber: UInt64 = 0
            guard Scanner(string: sanitizedHex).scanHexInt64(&hexNumber) else {
                self = .clear // 无效输入，返回透明颜色
                return
            }
            
            let r, g, b, a: Double
            switch sanitizedHex.count {
            case 6: // RGB (Hex: RRGGBB)
                r = Double((hexNumber & 0xFF0000) >> 16) / 255
                g = Double((hexNumber & 0x00FF00) >> 8) / 255
                b = Double(hexNumber & 0x0000FF) / 255
                a = 1.0
            case 8: // ARGB (Hex: AARRGGBB)
                a = Double((hexNumber & 0xFF000000) >> 24) / 255
                r = Double((hexNumber & 0x00FF0000) >> 16) / 255
                g = Double((hexNumber & 0x0000FF00) >> 8) / 255
                b = Double(hexNumber & 0x000000FF) / 255
            default:
                self = .clear // 无效输入，返回透明颜色
                return
            }
            
            self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
        }
}
