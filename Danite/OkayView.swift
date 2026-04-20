//
//  OkayView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 27.02.2026.
//

import SwiftUI

struct OkayView: View {
  var onNext: () -> ()
  
  @State private var step = 1
  @State private var lightMode = true
  
  var body: some View {
    ZStack {
      Group {
        Rectangle()
          .foregroundStyle(lightMode ? .white : .black)
      }
      .animation(nil, value: step)
      VStack(spacing: 0) {
        VStack(spacing: 1) {
          Text("да браток")
            .font(.system(size: 32))
            .opacity(step < 1 ? 0 : 1)
          HStack(spacing: 5) {
            Text("samsung")
              .scaleEffect(x: 1.5, anchor: .center)
              .fontDesign(.serif)
              .foregroundStyle(.red)
              .frame(width: 220)
            Text("это")
          }
          .font(.system(size: 32))
          .opacity(step < 2 ? 0 : 1)
          Text("НАСТОЯЩИЙ ТОП")
            .font(.system(size: 28, weight: .heavy, design: .serif))
            .opacity(step < 3 ? 0 : 1)
          VStack(spacing: 0) {
            Text("и пусть он...")
            Text("ЖИВЕТ ВЕЧНО")
          }
          .padding()
          .opacity(step < 4 ? 0 : 1)
        }
        .fontWeight(.bold)
        Image(.android)
          .resizable()
          .frame(width: 300, height: 80)
          .blur(radius: lightMode ? 3 : 0)
          .mask {
            if lightMode {
              Text("аминь")
                .scaleEffect(x: 2, anchor: .center)
                .font(.system(size: 45, weight: .heavy, design: .serif))
                .opacity(step < 5 ? 0 : 1)
            } else {
              Color.white
            }
          }
//          .animation(nil, value: step)
          .animation(nil, value: lightMode)
        if step == 5 {
          Toggle("Light Mode", systemImage: "sun", isOn: $lightMode)
            .padding(20)
            .tint(.red)
        }
      }
    }
    .ignoresSafeArea()
    .navigationBarBackButtonHidden()
    .animation(.easeInOut, value: step)
    .contentShape(Rectangle())
    .onTapGesture {
      if (step + 1 < 6) {
        step += 1
      } else {
        onNext()
      }
    }
  }
}

#Preview {
  OkayView(onNext: { })
}
