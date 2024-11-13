//
//  SwiftLanguage.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/14.
//

import SwiftUI

struct SwiftLanguage: View {
    let text = "ni hao" //  let 常量
    let screenWidth = UIScreen.main.bounds.size.width
    var on: Bool = false
    let error = "network error"
    var name: String?

    var body: some View {
        VStack {
            Text(text)
            TextDemo(text: on ? text : error)
            if !on && text.count > 0 {
                Text("新字符串")
            }
            Text(name ?? "默认值")
        }
    }
}

struct TextDemo: View {
    var text: String

    var body: some View {
        Text(text)
    }
}

struct SwiftLanguage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguage()
    }
}

/**
 数据类型：
 Int
 Double/Float
 String
 Bool
 Color
 Array
 Dictionary
 Optional 可空类型
 Tuples 元组
 Enums
 */
