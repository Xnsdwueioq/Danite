//
//  GiftView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 28.02.2026.
//

import SwiftUI
import SceneKit


struct GiftView: View {
  var body: some View {
    ZStack {
      VStack {
        Text("В туалете")
          .fontWeight(.bold)
        SceneView(
          scene: {
            let scn = SCNScene(named: "model.usdz")
            scn?.rootNode.eulerAngles.y = .pi / 1
            scn?.rootNode.scale = SCNVector3(0.8, 0.8, 0.8)
            let rotate = SCNAction.rotateBy(x: 0, y: .pi * 2, z: 0, duration: 10)
            scn?.rootNode.runAction(SCNAction.repeatForever(rotate))
            return scn
          }(),
          options: [.autoenablesDefaultLighting, .allowsCameraControl]
        )
        .frame(height: 400)
      }
    }
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  GiftView()
}
