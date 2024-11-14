//
//  SwiftUITextEditor.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/14.
//

import SwiftUI

struct SwiftUITextEditor: View {
    @State var inputText: String = ""
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $inputText) /// 多行文本框，没有占位文字
                .padding()

            if inputText.isEmpty {
                Text("请输入内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(25)
            }
        }
//        .border(Color.blue, width: 5)
        .overlay(content: { // 这里同 .border
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(UIColor.placeholderText), lineWidth: 1)
        })
        .padding()
        .frame(height: 320)
    }
}

struct SwiftUITextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextEditor()
    }
}
