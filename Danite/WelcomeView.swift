//
//  WelcomeView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 26.02.2026.
//

import SwiftUI

struct WelcomeView: View {
  var onNext: () -> ()
  @State private var step = 1
  
  var body: some View {
    ZStack {
      Image(.blood)
        .resizable()
        .scaledToFit()
        .offset(x: 0, y: step < 5 ? -480 : -360)
      VStack(spacing: 20) {
        VStack(spacing: -25) {
          Text("ПРИВЕТ")
            .font(.system(size: 95, weight: .black, design: .monospaced))
            .foregroundStyle(.red)
            .opacity(step < 1 ? 0 : 1)
          Text("если ты держишь")
            .font(.system(size: 39, weight: .heavy))
            .opacity(step < 2 ? 0 : 1)
        }
        HStack {
          Text("iphoуn")
            .font(.system(size: 32, weight: .black))
            .foregroundStyle(.red.mix(with: .black, by: 0.1))
            .shadow(color: .red, radius: step < 3 ? 0 : 20)
            .animation(.easeInOut(duration: 3), value: step)
            .scaleEffect(x: 1.5, y: 2, anchor: .leading)
          Text("в своих руках")
            .font(.system(size: 32, weight: .bold))
            .scaleEffect(x: 0.7, y: 2, anchor: .trailing)
        }
        .opacity(step < 3 ? 0 : 1)
        .padding(.vertical, 20)
        
        VStack(spacing: -10) {
          Text("ЗНОУЧИТ ЭТО")
            .font(.system(size: 32, weight: .black, design: .monospaced))
            .scaleEffect(x: 1.65, y: 1, anchor: .center)
            .opacity(step < 4 ? 0 : 1)

          Text("ВАЛЕРКА")
            .font(.system(size: 32, weight: .black, design: .monospaced))
            .scaleEffect(x: 2.6, y: 1, anchor: .center)
            .foregroundStyle(.red)
            .offset(x: step < 5 ? -200 : 0)
            .opacity(step < 5 ? 0 : 1)
        }
        if step >= 6 {
          Button(action: {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            onNext()
          }, label: {
            ZStack {
              Capsule()
                .foregroundStyle(.black)
              VStack {
                Text("ВАЛЕРКА ПРИВЕТ!")
                  .font(.system(size: 64, weight: .black))
                  .foregroundStyle(.white)
                Text("(сlick me)")
                  .foregroundStyle(.white)
              }
            }
          })
        }
//        .opacity(step < 6 ? 0 : 1)
      }
    }
    .animation(.easeInOut(duration: 1), value: step)
    .contentShape(Rectangle())
    .onTapGesture {
      if (step + 1) < 7 {
        step += 1
      }
    }
  }
}

#Preview {
  RouterView()
}
