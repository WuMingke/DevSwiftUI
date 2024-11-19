//
//  DisclosureGroup.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

struct DisclosureGroupDemo: View {
    var body: some View {
        DisclosureGroup("如何修改密码？", content: {
            Text("进入设置页，然后...")
                .font(.system(size: 14))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        })
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding()
    }
}

#Preview {
    DisclosureGroupDemo()
}
