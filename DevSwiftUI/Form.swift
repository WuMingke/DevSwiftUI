//
//  Form.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

/// 涉及的组件
/// Form Section Toggle
/// Picker
/// Stepper
struct FormView: View {
    @State var isDarkMode = false
    var body: some View {
        Form {
            // Section 分组
            Section(
                header: Text("顶部提示"),
                footer: Text("底部提示")
            ) {
                // 右侧的开关
                Toggle(isOn: $isDarkMode) {
                    Text("锄禾日当午")
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .onChange(of: isDarkMode, perform: { value in
                    // 在主线程中监听了值的变化
                    print(value)
                })
                Text("汗滴禾下土")
            }
            Section {
                Text("谁知盘中餐")
                Text("粒粒皆辛苦")
            }
        }
    }
}

/// 表单项的选择器
struct PickerView: View {
    private var selectedItem = ["推荐", "销量", "评分", "折扣"]
    @State private var selectedNum = 0

    @State private var textSize = 0
    @State private var textSize2: CFloat = 0

    var body: some View {
        Form {
            Picker("排序", selection: $selectedNum) {
                ForEach(0 ..< selectedItem.count, id: \.self) {
                    Text(self.selectedItem[$0])
                }
            }
            .pickerStyle(.inline) // 还有其它样式：.segmented .menu 等等
            .onChange(of: selectedNum, perform: { _ in
                print(selectedItem[selectedNum])
            })

            Stepper("字号", value: $textSize, in: 12 ... 72, step: 1)
                .onChange(of: textSize, perform: { value in
                    print(value)
                })

            Section(content: {
                /// 这里必须是 CFloat 类型
                Slider(value: $textSize2, in: 12 ... 72, step: 1)
                    .onChange(of: textSize2, perform: { value in
                        print(value)
                    })
            })
        }
    }
}

#Preview {
//    FormView()
    PickerView()
}
