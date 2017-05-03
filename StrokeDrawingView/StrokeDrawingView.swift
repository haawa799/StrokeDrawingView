//
//  StrokeDrawingView.swift
//  StrokeDrawingView
//
//  HAVE A NICE DAY!
//  ₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡
//
//  Created by Andrew Kharchyshyn
//  Copyright (c) 2015 StrokeDrawingView. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit


public protocol StrokeDrawingViewDataSource: class {
  func sizeOfDrawing() -> CGSize
  func numberOfStrokes() -> Int
  func pathForIndex(index: Int) -> UIBezierPath
  func animationDurationForStroke(index: Int) -> CFTimeInterval
  func colorForStrokeAtIndex(index: Int) -> UIColor
  func colorForUnderlineStrokes() -> UIColor?
}

public protocol StrokeDrawingViewDataDelegate: class {
  func layersAreNowReadyForAnimation()
}

public class StrokeDrawingView: UIView {
  
  fileprivate let defaultMiterLimit: CGFloat = 4
  fileprivate var numberOfStrokes: Int { return dataSource?.numberOfStrokes() ?? 0 }
  fileprivate var shouldDraw = false
  fileprivate var strokeLayers = [CAShapeLayer]()
  fileprivate var backgroundLayer = BackgroundLayer()
  fileprivate var drawingSize = CGSize.zero
  fileprivate var animations = [CABasicAnimation]()
  fileprivate var timer: Timer?
  
  deinit {
    timer?.invalidate()
  }
  
  // MARK: - Public API
  /// Custom drawing starts afte this property is set
  public var dataSource: StrokeDrawingViewDataSource? {
    didSet {
      guard let dataSource = dataSource else {return}
      drawingSize = dataSource.sizeOfDrawing()
      shouldDraw = true
      setNeedsDisplay()
    }
  }
  
  public var delegate: StrokeDrawingViewDataDelegate?
  
  /// Use this method to run looped animation
  public func playForever(delayBeforeEach: CFTimeInterval = 0) {
    
    guard let dataSource = dataSource else {return}
    let numberOfStrokes = dataSource.numberOfStrokes()
    var animationDuration: CFTimeInterval = 0
    for i in 0..<numberOfStrokes {
      animationDuration += dataSource.animationDurationForStroke(index: i)
    }
    
    playSingleAnimation()
    timer = Timer.scheduledTimer(timeInterval: delayBeforeEach + animationDuration, target: self, selector: #selector(StrokeDrawingView.playSingleAnimation), userInfo: nil, repeats: true)
  }
  
  /// Use this method to stop looped animation
  public func stopForeverAnimation() {
    timer?.invalidate()
    pauseLayers()
  }
  
  public func clean() {
    removeAnimationFromEachLayer()
    resetLayers()
    for layer in strokeLayers {
      layer.removeFromSuperlayer()
    }
    strokeLayers = [CAShapeLayer]()
  }
  
  /// Use this method to run single animation cycle
  public func playSingleAnimation() {
    removeAnimationFromEachLayer()
    setStrokesProgress(progress: 0)
    resetLayers()
    
    var counter = 0
    var duration: CFTimeInterval = CACurrentMediaTime()
    
    for strokeLayer in strokeLayers {
      
      let delay = duration
      let strokeAnimationDuration = dataSource?.animationDurationForStroke(index: counter) ?? 0
      duration += strokeAnimationDuration
      
      let anim = defaultAnimation(duration: strokeAnimationDuration, delayTime: delay)
      strokeLayer.add(anim, forKey: "strokeEndAnimation")
      
      counter += 1
    }
  }
  
  /// Use this method to reset strokes layers progress to 'progress'
  /// Can be value from 0 t0 1
  public func setStrokesProgress(progress: CGFloat) {
    for strokeLayer in strokeLayers {
      strokeLayer.strokeEnd = progress
    }
  }
  
}


// MARK:
extension StrokeDrawingView {
  
  fileprivate func pauseLayers() {
    for strokeLayer in strokeLayers {
      strokeLayer.pause()
    }
  }
  
  fileprivate func resetLayers() {
    for strokeLayer in strokeLayers {
      strokeLayer.reset()
    }
  }
  
  fileprivate func removeAnimationFromEachLayer() {
    for strokeLayer in strokeLayers {
      strokeLayer.removeAllAnimations()
    }
  }
  
  fileprivate func drawIfNeeded() {
    
    if shouldDraw == true && numberOfStrokes > 0 {
      
      layer.addSublayer(backgroundLayer)
      
      for strokeIndex in 0..<numberOfStrokes {
        
        let color = dataSource?.colorForStrokeAtIndex(index: strokeIndex) ?? UIColor.black
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.miterLimit = defaultMiterLimit
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        
        shapeLayer.strokeEnd = 0.0
        layer.addSublayer(shapeLayer)
        strokeLayers.append(shapeLayer)
      }
      shouldDraw = false
      delegate?.layersAreNowReadyForAnimation()
    }
  }
  
  fileprivate func defaultAnimation(duration: CFTimeInterval, delayTime: CFTimeInterval = 0, removeOnComletion: Bool = false) -> CABasicAnimation {
    let baseAnim = CABasicAnimation(keyPath: "strokeEnd")
    baseAnim.duration = duration
    baseAnim.beginTime = delayTime
    baseAnim.fromValue = 0
    baseAnim.fillMode = kCAFillModeForwards
    baseAnim.isRemovedOnCompletion = removeOnComletion
    baseAnim.toValue = 1
    return baseAnim
  }
  
  public override func draw(_ rect: CGRect) {
    drawIfNeeded()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    guard let dataSource = dataSource, strokeLayers.count > 0 else {return}
    
    let scale: CGFloat = bounds.height / drawingSize.height
    
    var pathes = [UIBezierPath]()
    
    for strokeIndex in 0..<numberOfStrokes {
      
      let strokeLayer = strokeLayers[strokeIndex]
      
      let path = dataSource.pathForIndex(index: strokeIndex)
      let pathCopy = UIBezierPath(cgPath: path.cgPath)
      pathCopy.lineWidth = path.lineWidth * scale
      pathes.append(pathCopy)
      pathCopy.apply(CGAffineTransform(scaleX: scale, y: scale))
      
      strokeLayer.lineWidth = path.lineWidth * scale
      strokeLayer.path = pathCopy.cgPath
    }
    
    if let underlineColor = dataSource.colorForUnderlineStrokes() {
      backgroundLayer.frame = bounds
      backgroundLayer.strokeColor = underlineColor
      backgroundLayer.strokes = pathes
      backgroundLayer.setNeedsDisplay()
    }
  }
}

extension CALayer {
  
  func pause() {
    let pausedTime = convertTime(CACurrentMediaTime(), from: nil)
    speed = 0.0
    timeOffset = pausedTime
  }
  
  func reset() {
    speed = 1.0
    timeOffset = 0.0
  }
  
  func resume() {
    let pausedTime = timeOffset
    speed = 1.0
    timeOffset = 0.0
    beginTime = 0.0
    let timeSincePause = convertTime(CACurrentMediaTime(), from: nil) - pausedTime
    beginTime = timeSincePause
  }
}


public func performWithDelay(delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

