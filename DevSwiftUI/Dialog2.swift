//
//  Dialog2.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

// FullScreenCover
/// 与NavigationLink跳转方法不同，
/// NavigationLink使用堆栈的形式进入页面，进入的方式为从左往右，
/// 且存在父子页面关系，NavigationView顶部导航试图会传递。
/// 而 fullScreenCover 全屏覆盖的方式是以弹窗的方式打开页面，
/// 进入方向是从下往上，页面之间为同级关系
/// NavigationLink 堆栈跳转，sheet模态跳转，fullScreenCover全屏覆盖跳转，
/// 构成了SwiftUI主要的几种页面跳转方式
struct Dialog2: View {
    @State var noteModel = noteModels
    @State var showAddNoteView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(noteModel) { model in
                    Text(model.content)
                }
            }
            .navigationBarTitle("笔记", displayMode: .inline)
            .navigationBarItems(trailing: newBtn)
        }
        /// 全屏展示页面
        .fullScreenCover(isPresented: $showAddNoteView, content: {
            AddNoteView(noteModels: $noteModel)
        })
    }

    private var newBtn: some View {
        Button(action: {
            self.showAddNoteView.toggle()
        }, label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 20))
        })
    }
}

#Preview {
    Dialog2()
}
