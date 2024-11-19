//
//  NetworkRequest.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct NetworkRequest: View {
    @State var colors: [ColorModel] = []
    var body: some View {
//        CardItem(cardName: "#ff0000", cardColor: .red)
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(colors) { item in
                CardItem(cardName: item.color, cardColor: Color(hex: item.color))
            }
        }
        /// 这跟hw有什么区别。。
        .onAppear {
//            getData()
            loadData()
        }
    }

    /// 网络数据
    private func loadData() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: jsonUrl)!) { data, _, _ in
            guard let jsonData = data else { return }
            do {
                let datas = try
                    JSONDecoder().decode([ColorModel].self, from: jsonData)
                DispatchQueue.main.async {
                    self.colors = datas
                }
            } catch {
                print(error)
            }
        }
        /// 执行这个task！！！
        .resume()
    }

    /// 本地数据
    private func getData() {
        if let url = Bundle.main.url(forResource: "colors", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                // 将Json解析为Swift
                colors = try decoder.decode([ColorModel].self, from: data)
            } catch {
                // 处理错误
            }
        } else {
            // 文件不存在
        }
    }
}

struct CardItem: View {
    var cardName: String
    var cardColor: Color
    var body: some View {
        Text(cardName)
            .font(.system(size: 23))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(cardColor)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

#Preview {
    NetworkRequest()
}
