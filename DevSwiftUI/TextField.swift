//
//  SwiftUITextField.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/14.
//

import SwiftUI

struct SwiftUITextField: View {
    @State var inputText: String = ""
    var body: some View {
        VStack {
            TextField("请输入", text: $inputText)
                .padding()
                .background(.green)
            SecureField("密码", text: $inputText)
                .padding()
                .background(.gray)

            TextField("请输入", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // 边框
                .textContentType(.telephoneNumber)
                .keyboardType(.numberPad)
                .disableAutocorrection(true) // 禁用自动修正
                .padding()

            TextField("Search", text: $inputText)
                .padding(10)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(content: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                })
        }
    }
}

struct SwiftUITextField_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextField()
    }
}
