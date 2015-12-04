//
//  ViewTest.swift
//  StrokeDrawingView
//
//  Created by Andriy K. on 12/2/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import FBSnapshotTestCase
import UIKit
import StrokeDrawingView


class TestCase0: FBSnapshotTestCase {
  let dataSource = TestDataSource()
  
  var viewToTest: StrokeDrawingView!
  
  override func setUp() {
    super.setUp()
    
    viewToTest = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    viewToTest.dataSource = dataSource
    viewToTest.backgroundColor = UIColor.whiteColor()
    viewToTest.drawRect(viewToTest.bounds)
    
//    recordMode = true
    usesDrawViewHierarchyInRect = true
  }
  
  func testFullDrawn() {
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    
    FBSnapshotVerifyView(viewToTest)
  }
  
}

let kanji = Kanji()

class TestDataSource : StrokeDrawingViewDataSource {
  func sizeOfDrawing() -> CGSize {
    return CGSize(width: 109, height: 109)
  }
  
  func numberOfStrokes() -> Int {
    return kanji.bezierPathes.count
  }
  
  func pathForIndex(index: Int) -> UIBezierPath {
    let p = kanji.bezierPathes[index]
    p.lineWidth = 3
    return p
  }
  
  func animationDurationForStroke(index: Int) -> CFTimeInterval {
    return 1
  }
  
  func colorForStrokeAtIndex(index: Int) -> UIColor {
    switch index {
    case 0...5: return kanji.color0
    case 5...8: return kanji.color1
    default: return kanji.color2
    }
  }
}

