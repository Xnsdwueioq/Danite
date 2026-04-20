//
//  ChestView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 27.02.2026.
//

import SwiftUI

struct ChestView: View {
  var onNext: () -> ()
  
  @State private var isClosed = true
  
  var body: some View {
    ZStack {
      VStack {
        Text("С ДНЕМ РОЖДЕНИЯ")
          .opacity(isClosed ? 0 : 1)
          .font(.system(size: 54, weight: .heavy, design: .serif))
        Spacer()
        ZStack {
          if isClosed {
            Image(.chestclosed)
              .resizable()
              .scaledToFit()
          } else {
            Image(.chestopened)
              .resizable()
              .scaledToFit()
              .scaleEffect(1.02)
              .offset(x: -1, y: -3)
          }
        }
      }
      if !isClosed {
        Color.white
          .transition(.opacity.animation(.easeIn(duration: 4).delay(1)))
        GiftView()
          .transition(.opacity.animation(.easeInOut(duration: 2).delay(6)))
      }
    }
    .navigationBarBackButtonHidden()
    .contentShape(Rectangle())
    .onTapGesture {
      if isClosed {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        withAnimation(.easeIn(duration: 0.5)) {
          isClosed = false
        }
      }
    }
  }
}

#Preview {
  ChestView(onNext: {})
}
