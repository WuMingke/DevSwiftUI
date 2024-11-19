//
//  ViewModel.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var showDetail: Bool = false

    @AppStorage("useFaceId") var useFaceId: Bool = false
}
