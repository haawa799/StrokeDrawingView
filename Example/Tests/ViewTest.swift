//
//  ViewTest.swift
//  StrokeDrawingView
//
//  Created by Andriy K. on 12/2/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import StrokeDrawingView

class ViewTest: FBSnapshotTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    self.recordMode = true
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    let strokedView = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    strokedView.backgroundColor = UIColor.cyanColor()
    FBSnapshotVerifyView(strokedView)
  }
  
}
