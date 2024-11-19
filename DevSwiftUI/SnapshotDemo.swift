//
//  SnapshotDemo.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct SnapshotDemo: View {
    var body: some View {
        VStack {
            imageCard
//                .onTapGesture {
//                    print(imageCard.snapshot())
//                }
            // TODO: 有问题
//            Image(uiImage: imageCard.snapshot()!)
        }
    }

    private var imageCard: some View {
        ZStack {
            Image("avatar")
                .resizable()
//                .scaledToFit()
                .frame(width: 200, height: 200)
                .cornerRadius(16)
                .overlay {
                    Text("覆盖在上面的文本")
                        .foregroundColor(.yellow)
                }
        }
    }
}

#Preview {
    SnapshotDemo()
}
