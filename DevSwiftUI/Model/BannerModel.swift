//
//  BannerModel.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

struct BannerModel: Identifiable {
    var id: UUID = .init()
    var imageName: String
}

var bannerModels = [
    BannerModel(imageName: "avatar"),
    BannerModel(imageName: "scene"),
    BannerModel(imageName: "startup")
]
