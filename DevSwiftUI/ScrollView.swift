//
//  ScrollView.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/18.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false)
        {
            HStack {
                ForEach(bannerModels) { item in
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .cornerRadius(8)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ScrollViewDemo()
}
