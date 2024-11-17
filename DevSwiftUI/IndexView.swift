//
//  IndexView.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/17.
//

import SwiftUI

/// TabView demo
/// 1 tab
/// 2 翻页的引导页
/// 3 轮播图
struct SwiftUITabView: View {
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            IndexView()
                .tabItem {
                    // 切换不同icon
                    Image(systemName: selectedTab == 0 ? "house.fill" : "heart")
                    Text("首页")
                }
                .tag(0)
            NavigationViewDemo2()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("设置")
                }
                .tag(1)
        }
        // 颜色
        .accentColor(.red)
        // 实现翻页的引导页
//        .tabViewStyle(/*@START_MENU_TOKEN@*/DefaultTabViewStyle()/*@END_MENU_TOKEN@*/)
//        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct IndexView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color(.green), lineWidth: 1)
                    }

                /// Spacer 指定间隔
                Spacer().frame(height: 24)

                Text("文章")
                    .font(.system(size: 17))
                    .foregroundColor(.black)

                Spacer().frame(height: 10)
                Text("高级工程师")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

                Spacer().frame(height: 24)

                Text("很长的一段文案，很长的一段文案，很长的一段文案，很长的一段文案")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .lineSpacing(5)
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                // 两种写法效果一致
//                    .padding(.leading, 24)
//                    .padding(.trailing, 24)
                Spacer()
            }
        }
    }
}

/// 轮播图
struct BannerView: View {
    var body: some View {
        VStack {
            TabView {
                ForEach(bannerModels) { item in
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .cornerRadius(16)
                        .padding(.horizontal)
                }
            }
            // 自带指示器
            .tabViewStyle(.page)
            .frame(height: 200)
//            .indexViewStyle(.page(backgroundDisplayMode: .always))
            Spacer()
        }
    }
}

#Preview {
//    IndexView()
//    SwiftUITabView()
    BannerView()
}
