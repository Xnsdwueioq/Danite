//
//  HowReceiveView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 27.02.2026.
//

import SwiftUI

struct HowReceiveView: View {
  var onNext: () -> ()
  
  @State private var password: String = ""
  let correctPassword = "i am kigdab"
  
  var body: some View {
    ZStack {
      MeshGradientView()
      VStack(spacing: 40) {
        VStack(spacing: -10) {
          VStack {
            Text("итак чтобы")
              .scaleEffect(x: 1.65)
            Text("получить подарок")
          }
          .font(.system(size: 32))
          HStack {
            Text("введи")
            Text("пароль")
              .fontWeight(.ultraLight)
              .fontWidth(.condensed)
              .shadow(color: .red, radius: 10)
          }
          .font(.system(size: 52))
        }
        SecureField("", text: $password)
          .textFieldStyle(.roundedBorder)
          .shadow(radius: 10)
          .padding(.horizontal, 100)
          .keyboardType(.asciiCapable)
        Button(action: {
          onNext()
        }) {
          ZStack {
            Circle()
            Image(systemName: "circle.dotted.circle.fill")
              .scaleEffect(2)
              .foregroundStyle(.white)
          }
            .frame(width: 60)
            .foregroundStyle(password.lowercased() == correctPassword ? .green : .red)
        }
      }
    }
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  HowReceiveView(onNext: { })
}
