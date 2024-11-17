//
//  RGBDemo.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

struct RGBDemo: View {
    @State private var redValue: CGFloat = 243
    @State private var greenValue: CGFloat = 248
    @State private var blueValue: CGFloat = 232
    var body: some View {
        Form {
            Rectangle()
                .fill(Color(red: redValue/255, green: greenValue/255, blue: blueValue/255))
                .frame(height: 200)
                .cornerRadius(8)

            Section {
                HStack(content: {
                    Text("R:\(String(Int(redValue)))")
                    Slider(value: $redValue, in: 0 ... 255, step: 1)
                        .accentColor(.red)
                })

                HStack(content: {
                    Text("G:\(String(Int(greenValue)))")
                    Slider(value: $greenValue, in: 0 ... 255, step: 1)
                        .accentColor(.green)

                })

                HStack(content: {
                    Text("B:\(String(Int(blueValue)))")
                    Slider(value: $blueValue, in: 0 ... 255, step: 1)
                        .accentColor(.blue)

                })
            }
        }
    }
}

struct ColorPickerDemo: View {
    @State private var colorValue: Color = .blue
    var body: some View {
        Form {
            Section {
                Rectangle()
                    .fill(colorValue)
                    .frame(height: 200)
                    .cornerRadius(8)
            }

            Section {
                /// 这里用到了扩展函数
                ColorPicker(colorValue.colorToString ?? "选择颜色", selection: $colorValue)
                    .onChange(of: colorValue, perform: { value in
                        print(value)
                    })
            }
        }
    }
}

#Preview {
//    RGBDemo()
    ColorPickerDemo()
}
