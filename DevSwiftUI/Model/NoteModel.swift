//
//  NoteModel.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

struct NoteModel: Identifiable {
    var id: UUID = .init()
    var content: String
}

var noteModels = [
    NoteModel(content: "这是一条笔记。")
]
