//
//  NoteApp.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

// FileManager 使用
struct NoteAppModel: Identifiable, Codable {
    var id: UUID = .init()
    var content: String
    var updateTime: String
}

class NoteAppViewMode: ObservableObject {
    @Published var showNewNoteView = false
    @AppStorage("darkMode") var darkMode = false

    @Published var noteAppModels = [NoteAppModel]()

    @Published var isEdit = false
    @Published var noteId = UUID()
    @Published var content: String = ""

    init() {
        loadItems()
    }

    /// 获取沙盒路径
    func documentsDirectiry() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    /// 存储业务数据
    func dataFilePath() -> URL {
        documentsDirectiry().appendingPathComponent("NoteAppModel.plist")
    }

    /// 读
    func loadItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                noteAppModels = try decoder.decode([NoteAppModel].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    /// 写
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(noteAppModels)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print(error.localizedDescription)
        }
    }

    /// 增
    func addItem(content: String, updateTime: String) {
        let newItem = NoteAppModel(content: content, updateTime: updateTime)
        noteAppModels.append(newItem)
        saveItems()
    }

    /// 删
    func deleteItem(itemId: UUID) {
        noteAppModels.removeAll(where: { $0.id == itemId })
        saveItems()
    }

    /// 改
    func editItem(item: NoteAppModel) {
        if let id = noteAppModels.firstIndex(where: { $0.id == item.id }) {
            noteAppModels[id] = item
            saveItems()
        }
    }

    /// 时间
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}

struct NoteCardItemView: View {
    var id: UUID
    var content: String
    var updateTime: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text(content)
                    .font(.system(size: 17))
                    .lineLimit(3)
                Spacer()
                HStack {
                    Spacer()
                    Text(updateTime)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            })
            .padding()
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, minHeight: 100, maxHeight: 140)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

/// 主界面
struct NoteApp: View {
    @StateObject private var viewModel = NoteAppViewMode()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.noteAppModels) { item in
                    NoteCardItemView(id: item.id, content: item.content, updateTime: item.updateTime)
                        .contextMenu(ContextMenu(menuItems: {
                            Button("删除") {
                                viewModel.deleteItem(itemId: item.id)
                            }
                        }))
                        .onTapGesture {
                            viewModel.isEdit = true
                            viewModel.noteId = item.id
                            viewModel.content = item.content
                            viewModel.showNewNoteView.toggle()
                        }
                }
            }
            .navigationBarTitle("笔记", displayMode: .inline)
            .navigationBarItems(leading: darkModeBtn, trailing: addBtn)
        }
        .preferredColorScheme(viewModel.darkMode ? .dark : .light)
        .sheet(isPresented: $viewModel.showNewNoteView, content: {
            NewNoteView(id: viewModel.noteId, showNewNoteView: $viewModel.showNewNoteView, viewModel: viewModel)
        })
    }

    private var addBtn: some View {
        Image(systemName: "plus.circle.fill")
            .font(.system(size: 20))
            .foregroundColor(.blue)
            .onTapGesture {
                viewModel.showNewNoteView.toggle()
            }
    }

    private var darkModeBtn: some View {
        Image(systemName: viewModel.darkMode ? "sun.max.circle.fill" : "moon.circle.fill")
            .font(.system(size: 19))
            .foregroundColor(viewModel.darkMode ? .white : .gray)
            .onTapGesture {
                viewModel.darkMode.toggle()
            }
    }
}

/// 新数据
struct NewNoteView: View {
    @State var id: UUID
    @State var content = ""
    @Binding var showNewNoteView: Bool
    var viewModel: NoteAppViewMode // 这样写我感觉不太对

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $content)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8).stroke(Color(.systemGray5), lineWidth: 1)
                        }
                    if content.isEmpty {
                        Text("请输入内容")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(10)
                    }
                }
                .frame(height: 320)
                .padding()
                Spacer()
            }

            .navigationBarTitle("新增笔记", displayMode: .inline)
            .navigationBarItems(leading: closeBtn, trailing: saveBtn)
        }
    }

    private var closeBtn: some View {
        Image(systemName: "xmark.circle.fill")
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .onTapGesture {
                showNewNoteView.toggle()
            }
    }

    private var saveBtn: some View {
        Text("保存")
            .font(.system(size: 20))
            .foregroundColor(.blue)
            .onTapGesture {
                if viewModel.isEdit {
                    viewModel.editItem(item: NoteAppModel(id: id, content: content, updateTime: viewModel.getTime()))
                } else {
                    viewModel.addItem(content: content, updateTime: viewModel.getTime())
                }
                viewModel.isEdit = false
                showNewNoteView.toggle()
            }
    }
}

#Preview {
    NoteApp()
//    NoteCardItemView(id: UUID(), content: "content", updateTime: "time")
}
