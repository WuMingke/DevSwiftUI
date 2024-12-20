//
//  AsImage.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

/// View 转 UIImage
extension View {
    func snapshot() -> UIImage? {
        let controller = UIHostingController(rootView: ignoresSafeArea().fixedSize(horizontal: true, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/))
        guard let view = controller.view else { return nil }
        let targetSize = view.intrinsicContentSize
        if targetSize.width<=0 || targetSize.height<=0 { return nil }
        view.bounds = CGRect(origin: .zero, size: targetSize)
        view.backgroundColor = .clear
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
