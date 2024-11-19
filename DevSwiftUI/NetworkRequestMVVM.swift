//
//  NetworkRequestMVVM.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

class ColorViewMode: ObservableObject {
    let jsonUrl = "https://api.npoint.io/d8051e871bd5ce31f5a4"
    @Published var colors: [ColorModel] = []

    init() {
        requestData()
    }

    private func requestData() {
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
        .resume()
    }
}

struct NetworkRequestMVVM: View {
    @StateObject var viewModel: ColorViewMode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.colors.shuffled()) { item in
                CardItem(cardName: item.color, cardColor: Color(hex: item.color))
            }
        }
    }
}

#Preview {
    NetworkRequestMVVM(viewModel: ColorViewMode())
}
