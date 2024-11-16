//
//  NavigationView.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/16.
//

import SwiftUI

struct NavigationViewDemo: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(8)
                    .padding()
                Spacer()
            }
            .navigationBarTitle("首页", displayMode: .inline)
//            .navigationTitle("首页")
            .navigationBarItems(leading: backBtn, trailing: shareBtn)
        }
    }
}

private var backBtn: some View {
    Button(action: {}, label: {
        HStack(content: {
            Image(systemName: "chevron.backward")
            Text("返回")
        }).foregroundColor(.black)
    })
}

private var shareBtn: some View {
    HStack {
        Button(action: {}, label: {
            Image(systemName: "magnifyingglass")
        })
        Button(action: {}, label: {
            Image(systemName: "square.and.arrow.up")
        })
    }.foregroundColor(.black)
}

////////////////////////////demo2///////////////////////////////

struct NavigationViewDemo2: View {
    var body: some View {
        NavigationView {
            VStack {
                // 包裹，点击跳转
                NavigationLink(destination: AccountSettingView(), label: {
                    SettingBtn(btnImage: "person", btnName: "账号设置")
                })
                SettingBtn(btnImage: "lock", btnName: "隐私设置")
                SettingBtn(btnImage: "paintpalette", btnName: "主题模式")
                SettingBtn(btnImage: "exclamationmark", btnName: "偏好设置")
                SettingBtn(btnImage: "questionmark.circle", btnName: "关于我们")
                Spacer()
            }
            .padding(.top)
            .navigationBarTitle("首页", displayMode: .inline)
            .navigationBarItems(leading: backBtn)
        }
    }
}

struct AccountSettingView: View {
    // 环境参数，用于返回
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        // 二级页面不需要NavigationView，会出现两个导航试图
//        NavigationView {
        Text("Hello!")
            .navigationTitle("账号设置")
            .navigationBarTitleDisplayMode(.inline)
            /// 隐藏默认生成的返回键。隐藏后，侧滑返回会失效，这里需要适配
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: backBtn2)
//        }
    }

    private var backBtn2: some View {
        Button(action: {
            // 返回
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack(content: {
                Image(systemName: "chevron.backward")
                Text("返回")
            }).foregroundColor(.black)
        })
    }
}

// 适配侧滑返回
// NavigationView 导航试图的底层是UIKit中的UINavigation，需要对底层的UINavigationController
// 类进行扩展，对UIGestureRecognizerDelegate协议的扩展控制，用于控制交互式弹出手势识别器的行为
// 在viewDidLoad中扩展手势识别器的代理，interactivePopGestureRecognizer 属性被赋值为self
// 确定是否应该识别弹出的手势，如果当前视图不是根视图，也就是当前视图是目标视图时，则返回true，允许返回，
// 否则返回false，禁止识别弹出的手势
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        /// self 是啥 ？？？
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}


// 列表item
struct SettingBtn: View {
    var btnImage: String
    var btnName: String
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Image(systemName: btnImage)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                Text(btnName)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 17))
                .foregroundColor(Color(.systemGray2))
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 68)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
//    NavigationViewDemo()
//    SettingBtn(btnImage: "person", btnName: "账号设置")
    NavigationViewDemo2()
//    AccountSettingView()
}
