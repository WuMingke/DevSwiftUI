//
//  Dialog4.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

/// Alert
struct Dialog4: View {
    @State private var showAlert = false
    var body: some View {
        Button(action: {
            self.showAlert.toggle()
        }, label: {
            HStack {
                Image(systemName: "trash.fill")
                Text("删除")
            }
            .foregroundColor(.red)
        })
        .alert(isPresented: $showAlert, content: { deleteAlert })
    }

    private var deleteAlert: Alert {
        return Alert(title: Text("title"),
                     message: Text("确定要删除吗？"),
                     primaryButton: .destructive(Text("确认")) {},
                     secondaryButton: .cancel(Text("取消")) {})
    }
}

#Preview {
    Dialog4()
}
