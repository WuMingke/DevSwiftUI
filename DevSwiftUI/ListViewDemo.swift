//
//  ListViewDemo.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/15.
//

import SwiftUI

struct ListViewDemo: View {
    @State var sentences = Sentences
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray5).edgesIgnoringSafeArea(.all) // 这里设置背景色
                List {
                    ForEach(sentences) { item in
                        ListItem(image: item.image, text: item.text)
                    }
                    .onMove(perform: moveItem)
                    .onDelete(perform: deleteItem)
                    /// 隐藏分割线
                    .listRowSeparator(.hidden)
                    /// 清除自身白色
                    .listRowBackground(Color.clear)
                }
                /// 这个居然是设置给 list 的！！
                .navigationBarTitle("账号中心", displayMode: .inline)
                .navigationBarItems(trailing: EditButton())
                /// 列表样式
                .listStyle(PlainListStyle())
            }
        }
    }

    // 移动item
    func moveItem(from source: IndexSet, to dest: Int) {
        sentences.move(fromOffsets: source, toOffset: dest)
    }

    // 删除item
    func deleteItem(at offsets: IndexSet) {
        sentences.remove(atOffsets: offsets)
    }
}

struct ListItem: View {
    var image: String
    var text: String
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))
            Text(text)
        }.padding(.all, 5)
    }
}

struct ListViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListViewDemo()
    }
}
