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

//class TestCase1: FBSnapshotTestCase {
//  
//  let dataSource = TestDataSource()
//  
//  var viewToTest: StrokeDrawingView!
//  
//  override func setUp() {
//    super.setUp()
//    
//    viewToTest = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//    viewToTest.dataSource = dataSource
//    viewToTest.backgroundColor = UIColor.whiteColor()
//    viewToTest.drawRect(viewToTest.bounds)
//    
//    recordMode = true
//    usesDrawViewHierarchyInRect = true
//  }
//  
//  func testA() {
//    FBSnapshotVerifyView(viewToTest)
//  }
//  
//  func testB() {
//    viewToTest.setStrokesProgress(1)
//    viewToTest.drawRect(viewToTest.bounds)
//    FBSnapshotVerifyView(viewToTest)
//  }
//  
//  func baseTestWithDelay(delay: Double) {
//  }
//  
//}

class TestCase0: FBSnapshotTestCase {
  let dataSource = TestDataSource()
  
  var viewToTest: StrokeDrawingView!
  
  override func setUp() {
    super.setUp()
    
    viewToTest = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    viewToTest.dataSource = dataSource
    viewToTest.backgroundColor = UIColor.whiteColor()
    viewToTest.drawRect(viewToTest.bounds)
    
    recordMode = true
    usesDrawViewHierarchyInRect = true
  }
  
  func testA() {
    
    let expectation = expectationWithDescription("3")
    
    viewToTest.stopForeverAnimation()
    viewToTest.playForever(3.0)
    performWithDelay(13) { () -> Void in
      self.viewToTest.stopForeverAnimation()
      self.viewToTest.drawRect(self.viewToTest.bounds)
      self.FBSnapshotVerifyView(self.viewToTest)
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(14, handler: nil)
    
  }
  
  func testB() {
    
    let expectation = expectationWithDescription("3")
    
    viewToTest.stopForeverAnimation()
    viewToTest.playForever(3.0)
    performWithDelay(3) { () -> Void in
      self.viewToTest.stopForeverAnimation()
      self.viewToTest.drawRect(self.viewToTest.bounds)
      self.FBSnapshotVerifyView(self.viewToTest)
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(4, handler: nil)
    
  }
  
}


let pathes = [
  UIBezierPath(svgPath: "M17.25,21.5c2.36,1.58,5.91,6.04,6.5,8.5"),
  UIBezierPath(svgPath: "M48.48,17.57c0.06,0.62-0.03,1.2-0.29,1.75c-0.89,2.29-3.56,6.19-7.07,8.68"),
  UIBezierPath(svgPath: "M13.25,36.5c2,0.38,3.64,0.22,5.61,0c6.89-0.75,21.23-3.02,27.43-3.02c1.98,0,2.48-0.21,3.72,0"),
  UIBezierPath(svgPath: "M31.74,14.25c0.88,0.88,1.55,1.88,1.55,3.25c0,0.87-0.1,23.62-0.1,33.25c0,1.59-0.05,2.88-0.07,3.75"),
  UIBezierPath(svgPath: "M32.5,35c0,1-0.59,1.94-0.93,2.65c-3.29,6.89-9.2,13.04-15.32,17.35"),
  UIBezierPath(svgPath: "M36.5,41c3.5,1.25,8.75,4.75,11.25,8.25"),
  UIBezierPath(svgPath: "M30.25,58.25c0.38,0.75,0.57,1.99,0.38,3.08c-0.97,5.36-4.48,12-8.75,18.27c-0.88,1.29,0.37,1.86,0.88,1.91c5.52,0.47,13.59,2.71,18.64,5.77c1.72,1.04,3.15,2.21,4.11,3.48"),
  UIBezierPath(svgPath: "M44,63.25c0.75,1.25,0.64,3.02,0.33,4.14c-2.52,9.05-9.8,22.38-27.83,29.11"),
  UIBezierPath(svgPath: "M13.5,70.4c0.75,0.69,1.75,1.13,3.75,0.94c3.75-0.35,23.09-3.49,32-5.25"),
  UIBezierPath(svgPath: "M65.75,16.25c0.37,1.12,0.48,2.38,0.17,3.63c-2.42,9.87-5.87,20.7-13.17,31.74"),
  UIBezierPath(svgPath: "M63.92,37.46c0.83,0.04,2.48,0.01,3.35-0.1c6.98-0.86,13.48-2.61,21.13-3.59c1.55-0.2,2.52-0.02,2.92,0.08"),
  UIBezierPath(svgPath: "M56.5,54.75c2.66,0,18.91,22.49,28.99,32.75c2.21,2.25,4.47,4.65,7.76,5"),
  UIBezierPath(svgPath: "M79.23,40.01c0.5,1.34,0.52,2.8,0,5.26C74.51,67.58,65.28,86.9,48.76,94"),
]

class TestDataSource : StrokeDrawingViewDataSource {
  func sizeOfDrawing() -> CGSize {
    return CGSize(width: 109, height: 109)
  }
  
  func numberOfStrokes() -> Int {
    return pathes.count
  }
  
  func pathForIndex(index: Int) -> UIBezierPath {
    let p = pathes[index]
    p.lineWidth = 3
    return p
  }
  
  func animationDurationForStroke(index: Int) -> CFTimeInterval {
    return 1
  }
  
  func colorForStrokeAtIndex(index: Int) -> UIColor {
    return UIColor.darkGrayColor()
  }
}

