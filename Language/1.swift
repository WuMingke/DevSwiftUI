//
//  1.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/23.
//

import SwiftUI

/// var 变量
/// let 常量
/// typealias 别名
///
/// Swift语言具有8位、16位、32位、64位的整数类型
/// 每种整数类型又分为有符号和无符号类型。
/// 有符号类型 Int 的整数包括 正整数、0、负整数，其存储空间最高位为符号位 1表示正数 0表示负数
/// 无符号类型 UInt 包括 正整数、0，没有符号位
/// var num: UInt8 = -4 报错
/// var num: Int? 声明可选类型，不赋值，自动设位 nil
/// var num: Int? = 1
/// print(num) 打印是 Optional(1)
/// num! 强制拆包，打印是 1
///
/// 字符串 是 值类型，
/// 当一个字符串赋值给另一个字符串时，每个字符串占独立的内存空间
/// 如果这两个字符串是常量，那么是占相同的内存空间
/// 如果从字符串中取子串，子串将与原字符串共享内存空间
/// 如果是修改子串，那么子串占独立的内存空间
///
/// 
///
///

struct TestLanguage: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
            .onAppear {
        
            }
    }
}

#Preview {
    TestLanguage()
}
