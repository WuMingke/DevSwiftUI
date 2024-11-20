//
//  Time.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/20.
//

import SwiftUI

struct Time: View {
    @State private var currentTime = "00:00:00"
    @State private var currentDate = ""
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text(currentTime)
                .font(.system(size: 48, design: .rounded))
                .frame(maxWidth: .infinity, maxHeight: 120)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.horizontal)
                .bold()
                // 监听变化
                .onReceive(timer, perform: { _ in
                    currentTime = getCurrentTime()
                })
                .onAppear(perform: {
                    currentTime = getCurrentTime()
                })
            
            Text(currentDate)
                .onAppear(perform: {
                    currentDate = getCurrentData()
                })
        }
    }

    private func getCurrentData() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: Date())
    }

    private func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: Date())
    }
}

#Preview {
    Time()
}
