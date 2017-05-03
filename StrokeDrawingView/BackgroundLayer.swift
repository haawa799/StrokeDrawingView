//
//  BackgroundLayer.swift
//  Pods
//
//  Created by Andriy K. on 12/28/15.
//
//

import UIKit

class BackgroundLayer: CALayer {
  
  var strokes: [UIBezierPath]?
  
  var strokeColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 0.5)
  
  override init() {
    super.init()
//    self.delegate = self
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
//    self.delegate = self
  }
  
  override init(layer: Any) {
    super.init(layer: layer)
    self.delegate = self
  }
  
  override func draw(in ctx: CGContext) {
    super.draw(in: ctx)
    
    guard let strokes = strokes else { return }
    
    for stroke in strokes {
      ctx.setStrokeColor(strokeColor.cgColor)
      ctx.setLineWidth(stroke.lineWidth - 1)
      ctx.addPath(stroke.cgPath)
      ctx.drawPath(using: .stroke)
    }
    
  }
  
}

extension BackgroundLayer: CALayerDelegate {
    
}
