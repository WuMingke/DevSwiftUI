//
//  DataFlow.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/19.
//

import SwiftUI

/// @State
struct DataFlow: View {
    @State private var isOpen = false
    var body: some View {
        Toggle(isOn: $isOpen, label: {
            Text(isOpen ?"开启" : "关闭")

        })
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

/// @Binding
struct DataFlowDatailView: View {
    @Binding var inputText: String
    @Binding var showDataFlowDetailView: Bool
    var body: some View {
        NavigationView {
            VStack {
                TextField("请输入", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
            }
            .navigationTitle("修改用户名")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: closeBtn)
        }
    }

    private var closeBtn: some View {
        Button(action: {
            self.showDataFlowDetailView.toggle()
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray)
        })
    }
}

struct DataFlow2: View {
    @State var inputText: String /// 可以自己初始化，也可以外部初始化
    @State private var showDetail = false
    var body: some View {
        VStack {
            HStack {
                Text("用户名")
                Spacer()
                /// 双向绑定
                Text(inputText)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture {
                self.showDetail.toggle()
            }
            Spacer()
        }
        .sheet(isPresented: $showDetail, content: {
            DataFlowDatailView(inputText: $inputText, showDataFlowDetailView: $showDetail)
        })
    }
}

/// @EnvironmentObject
struct DataFlow3: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        VStack {
            HStack {
                Text("用户名")
                Spacer()
                /// 双向绑定
                Text(viewModel.inputText)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture {
                self.viewModel.showDetail.toggle()
            }
            Spacer()
        }
        .sheet(isPresented: $viewModel.showDetail, content: {
            DataFlowDatailView2()
        })
    }
}

struct DataFlowDatailView2: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            VStack {
                TextField("请输入", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
            }
            .navigationTitle("修改用户名")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: closeBtn)
        }
    }

    private var closeBtn: some View {
        Button(action: {
            self.viewModel.showDetail.toggle()
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray)
        })
    }
}

/// @AppStorage
struct DataFlow4: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        Toggle(isOn: $viewModel.useFaceId, label: {
            Text(viewModel.useFaceId ?"开启" : "关闭")

        })
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
//    DataFlow()
//    DataFlow2(inputText: "")
//    DataFlow3().environmentObject(ViewModel()) /// 这里注入ViewModel
    DataFlow4().environmentObject(ViewModel())
}
