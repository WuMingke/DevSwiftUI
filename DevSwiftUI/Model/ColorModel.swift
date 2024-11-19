//
//  ColorModel.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

struct ColorModel: Identifiable, Codable { // Codable协议:将Json格式的数据解码为Swift对象
    var id: Int
    var color: String
}

var colorModels = [
    ColorModel(id: 1, color: "#FF0000"),
    ColorModel(id: 2, color: "#DC143C"),
    ColorModel(id: 3, color: "#00CED1"),
    ColorModel(id: 4, color: "#00FA9A"),
    ColorModel(id: 5, color: "#2E8B57"),
    ColorModel(id: 6, color: "#800000"),
    ColorModel(id: 7, color: "#FFF8DC"),
    ColorModel(id: 8, color: "#FFD700"),
    ColorModel(id: 9, color: "#FFA500"),
    ColorModel(id: 10, color: "#556B2F"),
]

///  https://www.npoint.io/  第三方接口平台
let jsonUrl = "https://api.npoint.io/d8051e871bd5ce31f5a4"
