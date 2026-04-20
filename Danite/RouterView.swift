//
//  RouterView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 26.02.2026.
//

import SwiftUI

enum AppScreen {
  case welcome
  case congratulation
  case who
  case productPicker
  case modelPicker
  case okay
  case howReceive
  case chest
}

struct RouterView: View {
  @State private var path: [AppScreen] = []
  
  var body: some View {
    NavigationStack(path: $path) {
      WelcomeView(onNext: { path.append(.congratulation) })
        .navigationDestination(for: AppScreen.self, destination: { screen in
          switch screen {
          case .congratulation:
            CongratulationView(onNext: { path.append(.who) })
          case .who:
            WhoView(onNext: { path.append(.productPicker) })
          case .productPicker:
            ProductPickerView(onNext: { path.append(.modelPicker) })
          case .modelPicker:
            ModelPickerView(onNext: { path.append(.okay) })
          case .okay:
            OkayView(onNext: { path.append(.howReceive) })
          case .howReceive:
            HowReceiveView(onNext: { path.append(.chest) })
          case .chest:
            ChestView(onNext: { })
          default: EmptyView()
          }
        })
    }
  }
}

#Preview {
  RouterView()
}
