//
//  ProductPickerView.swift
//  Danite
//
//  Created by Eyhciurmrn Zmpodackrl on 27.02.2026.
//

import SwiftUI
import SpriteKit
import CoreMotion

enum ProductPhotos: String {
  case pringles
  case samyxin
  case samyxinLight
}

class PhysicsScene: SKScene {
  let motionManager = CMMotionManager()
  var onNext: () -> () = {}
  
  convenience init(onNext: @escaping () -> Void) {
    self.init()
    self.onNext = onNext
  }
  
  override func didMove(to view: SKView) {
    // Границы экрана, чтобы фотки не улетали в пустоту
    self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    
    // Запускаем акселерометр
    if motionManager.isAccelerometerAvailable {
      motionManager.accelerometerUpdateInterval = 0.1
      motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
        guard let data = data else { return }
        // Меняем гравитацию в зависимости от наклона
        self?.physicsWorld.gravity = CGVector(dx: data.acceleration.x * 10,
                                              dy: data.acceleration.y * 10)
      }
    }
    // Генерируем тестовые фотки (квадраты)
    for _ in 1...60 {
      addPhoto(image: String("samyxin"))
    }
    addPhoto(image: ProductPhotos.pringles.rawValue)
    addPhoto(image: ProductPhotos.samyxinLight.rawValue, with: "next")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // Берем координаты первого касания
    guard let touch = touches.first else { return }
    let location = touch.location(in: self)
    
    // Определяем, какой объект находится в этой точке
    let tappedNode = atPoint(location)
    
    // Проверяем, что нажали именно на наше фото
    if tappedNode.name == "photoNode" ||  tappedNode.name == "next" {
      // Пример взаимодействия: подбросить вверх при нажатии
      tappedNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 300))
      
      // Или можно сделать легкую анимацию пульсации
      let scaleUp = SKAction.scale(to: 1.1, duration: 0.1)
      let scaleDown = SKAction.scale(to: 1.0, duration: 0.1)
      tappedNode.run(SKAction.sequence([scaleUp, scaleDown]))
      UIImpactFeedbackGenerator(style: .soft).impactOccurred()
      
      if tappedNode.name == "next" {
        onNext()
      }
    }
  }
  
  func addPhoto(image name: String, with nodeName: String = "photoNode") {
    let size = CGSize(width: 50, height: 50)
    let node = SKSpriteNode(imageNamed: name)
    
    // ВАЖНО: Присваиваем имя ноде, чтобы потом найти её при нажатии
    node.name = nodeName
    
    node.size = size
    node.position = CGPoint(x: CGFloat.random(in: 100...300),
                            y: CGFloat.random(in: 500...700))
    
    node.physicsBody = SKPhysicsBody(rectangleOf: size)
    node.physicsBody?.restitution = 0.5
    node.physicsBody?.allowsRotation = true
    
    addChild(node)
  }
}

struct ProductPickerView: View {
  var onNext: () -> ()
  
  var scene: SKScene {
    let scene = PhysicsScene(onNext: onNext)
    scene.size = CGSize(width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height)
    scene.scaleMode = .fill
    scene.backgroundColor = .clear
    return scene
  }
  
  var body: some View {
    SpriteView(scene: scene, options: [.allowsTransparency])
      .background(
        Image(.ladybugs)
          .resizable()
          .scaledToFill()
      )
      .ignoresSafeArea()
      .navigationBarBackButtonHidden()
  }
}

#Preview {
  ProductPickerView(onNext: {})
}
