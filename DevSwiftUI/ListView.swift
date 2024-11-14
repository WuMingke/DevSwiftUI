//
//  List.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/14.
//

import SwiftUI

struct ListView: View {
    var str = ["item 1", "item 2"]
    var body: some View {
        VStack {
            List {
                Text("item 1")
                Text("item 2")
            }
//            Spacer()
            List {
                ForEach(str.indices, id: \.self) { item in
                    Text(str[item])
                }
            }
            Spacer()
            
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
