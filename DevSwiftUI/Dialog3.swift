//
//  Dialog3.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

/// ActionSheet
struct Dialog3: View {
    @State private var showActionSheet = false
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }, label: {
            VStack(spacing: 15, content: {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(.title))
                    .foregroundColor(Color(.systemGray2))
                Text("上传图片")
                    .foregroundColor(Color(.systemGray2))
            })
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(16)
        })
        .actionSheet(isPresented: $showActionSheet, content: {
            actionSheet
        })
    }

    private var actionSheet: ActionSheet {
        let action = ActionSheet(title: Text("更多操作"),
                                 buttons: [
                                     .default(Text("相机拍照"), action: {}),
                                     .default(Text("相册上传"), action: {}),
                                     .cancel(Text("取消"), action: {}),
                                     /// 强操作按钮
                                     .destructive(Text("destructive"), action: {}),
                                 ])
        return action
    }
}

#Preview {
    Dialog3()
}
