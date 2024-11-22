//
//  Animation3.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/22.
//

import SwiftUI

struct Animation3: View {
    @State private var isStart: Bool = false
    @State private var isPause: Bool = false
    var body: some View {
        VStack {
            if isStart {
                if isPause {
                    HStack {
                        Btn(btnName: "结束", btnColor: .red)
                            .onTapGesture {
                                isStart.toggle()
                                isPause.toggle()
                            }

                        Btn(btnName: "继续", btnColor: .green)
                            .onTapGesture {
                                withAnimation(
                                    .spring(response: 0.5,
                                            dampingFraction: 0.8,
                                            blendDuration: 0.5))
                                {
                                    isPause.toggle()
                                }
                            }
                    }

                } else {
                    Btn(btnName: "暂停", btnColor: .green)
                        .onTapGesture {
                            withAnimation(
                                .spring(response: 0.5,
                                        dampingFraction: 0.8,
                                        blendDuration: 0.5))
                            {
                                isPause.toggle()
                            }
                        }
                }
            } else {
                Btn(btnName: "开始", btnColor: Color.green)
                    .onTapGesture {
                        isStart.toggle()
                    }
            }
        }
    }
}

struct Btn: View {
    var btnName: String
    var btnColor: Color
    var body: some View {
        Text(btnName)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
            .background(btnColor)
            .cornerRadius(32)
            .padding(.horizontal)
    }
}

#Preview {
    Animation3()
}
