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
  
  var viewToTest: StrokeDrawingView!
  
  override func setUp() {
    super.setUp()
    
    viewToTest = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    viewToTest.dataSource = TestDataSource(version: 0)
    viewToTest.backgroundColor = UIColor.whiteColor()
    viewToTest.drawRect(viewToTest.bounds)
    
//    recordMode = true
    usesDrawViewHierarchyInRect = true
  }
  
  func testFullDrawn0() {
    viewToTest.dataSource = TestDataSource(version: 0)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn1() {
    viewToTest.dataSource = TestDataSource(version: 1)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn2() {
    viewToTest.dataSource = TestDataSource(version: 2)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn3() {
    viewToTest.dataSource = TestDataSource(version: 3)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn4() {
    viewToTest.dataSource = TestDataSource(version: 4)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn5() {
    viewToTest.dataSource = TestDataSource(version: 5)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn6() {
    viewToTest.dataSource = TestDataSource(version: 6)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
  func testFullDrawn7() {
    viewToTest.dataSource = TestDataSource(version: 7)
    viewToTest.setStrokesProgress(1)
    viewToTest.drawRect(viewToTest.bounds)
    
    FBSnapshotVerifyView(viewToTest)
  }
  
}

class TestDataSource : StrokeDrawingViewDataSource {
  
  let kanjiArray = [Kanji(kanji: "数"),Kanji(kanji: "京"),Kanji(kanji: "苦"),Kanji(kanji: "働"),Kanji(kanji: "指"),Kanji(kanji: "郎"),Kanji(kanji: "病"),Kanji(kanji: "院")]
  let index: Int
  var kanji: Kanji {
    return kanjiArray[index]
  }
  
  init(version: Int) {
    index = version
  }
  
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

