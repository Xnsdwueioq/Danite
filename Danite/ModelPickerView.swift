//
//  ModelPickerView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 27.02.2026.
//

import SwiftUI

struct ModelPickerView: View {
  var onNext: () -> ()
  @State var isIOSActive = true
  @State var errorAlert = false
  
  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        ZStack {
          Image(.lava)
            .resizable()
            .scaledToFill()
            .frame(height: 450)
          Button(action: {
            if isIOSActive {
              errorAlert.toggle()
            } else {
              onNext()
            }
          }, label: {
            ZStack {
              RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(isIOSActive ? .orange : .blue.mix(with: .white, by: 0.3))
                .frame(width: 100, height: 40)
              Text("Android")
                .foregroundStyle(.white)
                .fontWeight(.heavy)
            }
          })
          .offset(y: isIOSActive ? 0 : 450)
        }.zIndex(2)
        
        ZStack {
          Image(.heaven)
            .resizable()
            .scaledToFill()
            .frame(height: 450)
          if isIOSActive {
            Button(action: {
              withAnimation(.easeIn(duration: 1)) {
                isIOSActive = false
              }
            }, label: {
              ZStack {
                RoundedRectangle(cornerRadius: 20)
                  .foregroundStyle(.blue.mix(with: .white, by: 0.3))
                  .frame(width: 100, height: 40)
                Text("iOS")
                  .foregroundStyle(.white)
                  .fontWeight(.heavy)
              }
            })
          }
        }
        .zIndex(1)
      }
    }
    .alert("Error Warning", isPresented: $errorAlert, actions: {
      Button("Cancel") {
        errorAlert.toggle()
      }
    }, message: {
      Text("UI Error: Failed to initialize tap gesture, system due to time out. Log messages may be missing. If this issue persists, try setting IDEPreferLogStreaming=YES in the active scheme actions environment variables.")
    })
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  ModelPickerView(onNext: { })
}
