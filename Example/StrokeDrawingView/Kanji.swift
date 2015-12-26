//
//  Kanji.swift
//  StrokeDrawingView
//
//  Created by Andriy K. on 12/4/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import KanjiBezierPaths

struct Kanji {
  
  let color0 = UIColor(red:0.95, green:0, blue:0.63, alpha:1)
  let color1 = UIColor(red:0.63, green:0, blue:0.95, alpha:1)
  let color2 = UIColor(red:0.23, green:0.7, blue:0.96, alpha:1)
 
  
  let bezierPathes: [UIBezierPath]
  let kanji: String
  
  init(kanji: String) {
    self.kanji = kanji
    self.bezierPathes = KanjiBezierPathesHelper.pathesForKanji(kanji) ?? [UIBezierPath]()
  }
  
}
