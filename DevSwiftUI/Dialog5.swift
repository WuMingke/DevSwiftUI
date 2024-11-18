//
//  Dialog5.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

/// contextMenu 上下文菜单
struct Dialog5: View {
    @State private var text: String = "你逆光而来，"
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .contextMenu(ContextMenu(menuItems: {
                /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
            }))
    }
}

#Preview {
    Dialog5()
}
