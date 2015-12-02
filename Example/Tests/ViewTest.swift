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

class MySpec: FBSnapshotTestCase {
  
  func testView() {
    
//    recordMode = true
    
    let strokedView = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    strokedView.backgroundColor = UIColor.yellowColor()
    
    FBSnapshotVerifyView(strokedView)
  }
  
}
