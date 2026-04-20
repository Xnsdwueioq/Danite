//
//  WhoView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 27.02.2026.
//

import SwiftUI

struct WhoView: View {
  var onNext: () -> ()
  
  @State private var state = ViewState.idle
  @State private var isPresented = false
  
  var body: some View {
    ZStack {
      MeshGradientView()
      Color.clear
      VStack(spacing: 5) {
        VStack(spacing: 10) {
          Image(state == .ai ? .samyxinAI : .samyxin)
            .resizable()
            .scaledToFit()
            .frame(width: 260)
          Text("Кто это?")
            .font(.largeTitle)
            .fontWeight(.heavy)
        }
        Spacer()
        VStack {
          if state != .ai {
            Button(action: {
              withAnimation {
                state = .ai
              }
            }, label: {
              ZStack {
                RoundedRectangle(cornerRadius: 20)
                  .frame(width: 200, height: 60)
                  .foregroundStyle(.pink)
                Text("ИИ")
                  .foregroundStyle(.white)
                  .fontWeight(.bold)
              }
            })
          }
          
          Button(action: {
            onNext()
          }, label: {
            ZStack {
              RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 60)
                .foregroundStyle(.yellow)
              HStack {
                Text("...кажется это ")
                Text("я")
              }
              .foregroundStyle(.white)
              .fontWeight(.bold)
            }
          })
          
          Button(action: {
            isPresented.toggle()
          }, label: {
            ZStack {
              RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 60)
                .foregroundStyle(.green)
              Text("Спросить у мамы")
                .foregroundStyle(.white)
                .fontWeight(.bold)
            }
          })
          .popover(isPresented: $isPresented, content: {
            Link("+7 (953) 585-07-00", destination: URL(string: "tel:79535850700")!)
                .font(.title)
                .foregroundColor(.blue)
              .padding(20)
              .presentationCompactAdaptation(.popover)
          })
        }
        Spacer()
      }
    }
    .transition(.opacity.combined(with: .scale))
    .navigationBarBackButtonHidden()
    .contentShape(Rectangle())
  }
  
  enum ViewState {
    case idle
    case ai
  }
}

#Preview {
  WhoView(onNext: {})
}
