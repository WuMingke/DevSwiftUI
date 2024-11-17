//
//  Dialog.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

/// .sheet 模态弹窗
struct Dialog: View {
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
        // 模态弹窗修饰符
        .sheet(isPresented: $showAddNoteView, content: {
            /// @Binding $ 双向绑定
            AddNoteView(noteModels: $noteModel)
        })
    }

    private var newBtn: some View {
        Button(action: {
            /// 打开新页面
            self.showAddNoteView.toggle()
        }, label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 20))
        })
    }
}

struct AddNoteView: View {
    @State var content: String = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var noteModels: [NoteModel]
    var body: some View {
        NavigationView {
            VStack {
                TextField("请输入内容", text: $content)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
            }
            .navigationBarTitle("新增笔记", displayMode: .inline)
            .navigationBarItems(leading: closeBtn, trailing: saveBtn)
        }
    }

    private var closeBtn: some View {
        Button(action: {
            /// 关闭页面
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(Color(.systemGray3))
        })
    }

    private var saveBtn: some View {
        Button(action: {
            /// 保存
            if !content.isEmpty {
                noteModels.append(NoteModel(content: content))
            }
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("保存")
                .font(.system(size: 17))
        })
    }
}

#Preview {
    Dialog()
//    AddNoteView()
}
