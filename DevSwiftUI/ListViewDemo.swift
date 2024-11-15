//
//  ListViewDemo.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/15.
//

import SwiftUI

struct ListViewDemo: View {
    var body: some View {
        List {
            ForEach(Sentences) { item in
                ListItem(image: item.image, text: item.text)
            }
        }
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
