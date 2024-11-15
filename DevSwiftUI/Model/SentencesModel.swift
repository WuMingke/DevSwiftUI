//
//  SentencesModel.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/15.
//

import Foundation

struct SentencesModel: Identifiable {
    var id: UUID = .init()
    var image: String
    var text: String
}

var Sentences = [
    SentencesModel(image: "star", text: "微信"),
    SentencesModel(image: "airplane", text: "QQ"),
    SentencesModel(image: "house", text: "微博"),
    SentencesModel(image: "keyboard", text: "小红书"),
    SentencesModel(image: "doc", text: "抖音"),
    SentencesModel(image: "square.stack.3d.down.right.fill", text: "bilibili"),
    SentencesModel(image: "person.3.sequence.fill", text: "知乎"),
]
