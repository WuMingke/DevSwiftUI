//
//  ShareSheet.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/20.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var items: Any
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
