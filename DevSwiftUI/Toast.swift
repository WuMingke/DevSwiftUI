//
//  Toast.swift
//  DevSwiftUI
//
//  Created by mingke on 2024/11/21.
//

import SwiftUI

struct Toast: View {
    @State private var showToast = false
    @State private var toastContent = "this is a toast"
    
    @State private var isOpen = false
    var body: some View {
        
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    showToast.toggle()
                }
                .toast(present: $showToast, message: $toastContent, aligment: .bottom)
            
            Toggle(isOn: $isOpen, label: {
                Image(systemName: isOpen ? "power.circle.fill" : "power.circle")
                    .font(.system(size: 68))
            })
            .tint(.green)
            .toggleStyle(.button)
            .clipShape(Circle())
        }
    }
}

extension View {
    func toast(present: Binding<Bool>, message: Binding<String>, aligment: Alignment = .center) -> some View {
        modifier(ToastView(present: present, message: message, aligment: aligment))
    }
}

struct ToastView: ViewModifier {
    @Binding var present: Bool
    @Binding var message: String
    var aligment: Alignment = .center

    func body(content: Content) -> some View {
        ZStack {
            content.zIndex(0)
            VStack {
                Text(message)
                    .padding(Edge.Set.horizontal, 20)
                    .padding(Edge.Set.vertical, 10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: aligment)
            .background(Color.gray.opacity(0.1))
            .opacity(present ? 1 : 0)
            .zIndex(1)
            .onChange(of: present) { value in
                if value {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        present.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    Toast()
}
