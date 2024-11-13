//
//  StatusPageView.swift
//  DevSwiftUI
//
//  Created by 吴清冽 on 2024/11/13.
//

import SwiftUI

struct StatusPageView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(.black)
            .opacity(0.6)
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120)

                VStack(spacing: 10) {
                    Text("签到成功")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .bold()
                    Text("再签2天可获得500积分")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                }
                Text("知道了")
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(width: 180)
                    .background(.green)
                    .cornerRadius(32)
            }
            .padding()
            .frame(maxWidth: 320)
            .background(.white)
            .cornerRadius(16)
        }
    }
}

struct StatusPageView_Previews: PreviewProvider {
    static var previews: some View {
        StatusPageView()
    }
}
