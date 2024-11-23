//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by mingke on 2024/11/23.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyWidgetLiveActivity()
    }
}
