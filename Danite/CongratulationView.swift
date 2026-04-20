//
//  CongratulationView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 26.02.2026.
//

import SwiftUI

struct CongratulationView: View {
  var onNext: () -> ()
  @State private var step = 1
  
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        VStack(spacing: 5) {
          HStack {
            Text("C ДНЕМ")
            Text("ВАРЕНЬЯ")
              .foregroundStyle(.green)
          }
          Text("МОЙ ДОРОГОЙ")
          .font(.system(size: 49, weight: .black, design: .monospaced))
          VStack {
            HStack(spacing: 0) {
              if step > 1 {
                Text("ПУК")
                  .font(.system(size: 64, weight: .black))
                  .foregroundStyle(.brown)
                  .strikethrough(step > 2, color: .red)
              }
              if step > 2 {
                Text("ДРУГ")
                  .font(.system(size: 64, weight: .bold, design: .monospaced))
                  .scaleEffect(x: 1.1, anchor: .leading)
                  .foregroundStyle(.red)
                  .frame(width: 190)
              }
            }
          }
        }
        .font(.system(size: 40, weight: .heavy, design: .monospaced))
        .scaleEffect(step < 1 ? 1.2 : 1)
        .opacity(step < 1 ? 0 : 1)
        
        if step > 3 {
          ZStack {
            Image(.cheese)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 200, height: 160)
              .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(spacing: 10) {
              Button(action: {
                onNext()
              }, label: {
                ZStack {
                  Capsule()
                    .frame(width: 170, height: 50)
                    .foregroundStyle(.green)
                    .shadow(radius: 3, y: 1)
                  Text("ОХ ничего себе")
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
                }
              })
              
              Button(action: {
                step += 1
              }, label: {
                ZStack {
                  Capsule()
                    .frame(width: 170, height: 50)
                    .foregroundStyle(.red)
                    .shadow(radius: 3, y: 1)
                  Text("ВЫЙТИ НАФИГ")
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
                    .disabled(step > 5 ? true : false)
                }
              })
              .opacity(step > 5 ? 0 : 1)
              .animation(.default, value: step)
            }
          }
        }
      }
      .animation(.spring(duration: 0.5, bounce: 0.6), value: step)
      if step == 5 {
        MomoView(step: $step)
      }
    }
    .navigationBarBackButtonHidden()
    .contentShape(Rectangle())
    .onTapGesture {
      if (step + 1) < 5 {
        step += 1
      }
    }
  }
}

struct MomoView: View {
  @Binding var step: Int
  
  var body: some View {
    Image(.room)
      .resizable()
      .scaledToFill()
      .ignoresSafeArea()
    VStack(spacing: 70) {
      Spacer()
      Image(.momo)
        .resizable()
        .scaledToFit()
        .frame(width: 220)
        .transition(.move(edge: .top))
      Spacer()
      
      Button(action: {
        step += 1
      }, label: {
        ZStack {
          Capsule()
            .foregroundStyle(.red.mix(with: .black, by: 0.3))
            .frame(width: 130, height: 40)
          Text("я передумал")
            .foregroundStyle(.white)
            .fontWeight(.bold)
        }
      })
    }
  }
}

#Preview {
  CongratulationView(onNext: {})
}
