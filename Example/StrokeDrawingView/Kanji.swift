//
//  Kanji.swift
//  StrokeDrawingView
//
//  Created by Andriy K. on 12/4/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit

class Kanji: NSObject {
  
  let bezierPathes: [UIBezierPath] = {
    
    var pathes = [UIBezierPath]()
    
    //// kvg:StrokePaths_06570
    //// kvg:06570
    //// kvg:06570-g1
    //// kvg:06570-g2
    //// kvg:06570-s1 Drawing
    var kvg06570s1Path = UIBezierPath()
    kvg06570s1Path.moveToPoint(CGPointMake(17.25, 21.5))
    kvg06570s1Path.addCurveToPoint(CGPointMake(23.75, 30), controlPoint1: CGPointMake(19.61, 23.08), controlPoint2: CGPointMake(23.16, 27.54))
    pathes.append(kvg06570s1Path)
    
    
    //// kvg:06570-s2 Drawing
    var kvg06570s2Path = UIBezierPath()
    kvg06570s2Path.moveToPoint(CGPointMake(48.48, 17.57))
    kvg06570s2Path.addCurveToPoint(CGPointMake(48.19, 19.32), controlPoint1: CGPointMake(48.54, 18.19), controlPoint2: CGPointMake(48.45, 18.77))
    kvg06570s2Path.addCurveToPoint(CGPointMake(41.12, 28), controlPoint1: CGPointMake(47.3, 21.61), controlPoint2: CGPointMake(44.63, 25.51))
    pathes.append(kvg06570s2Path)
    
    
    //// kvg:06570-s3 Drawing
    var kvg06570s3Path = UIBezierPath()
    kvg06570s3Path.moveToPoint(CGPointMake(13.25, 36.5))
    kvg06570s3Path.addCurveToPoint(CGPointMake(18.86, 36.5), controlPoint1: CGPointMake(15.25, 36.88), controlPoint2: CGPointMake(16.89, 36.72))
    kvg06570s3Path.addCurveToPoint(CGPointMake(46.29, 33.48), controlPoint1: CGPointMake(25.75, 35.75), controlPoint2: CGPointMake(40.09, 33.48))
    kvg06570s3Path.addCurveToPoint(CGPointMake(50.01, 33.48), controlPoint1: CGPointMake(48.27, 33.48), controlPoint2: CGPointMake(48.77, 33.27))
    pathes.append(kvg06570s3Path)
    
    
    //// kvg:06570-s4 Drawing
    var kvg06570s4Path = UIBezierPath()
    kvg06570s4Path.moveToPoint(CGPointMake(31.74, 14.25))
    kvg06570s4Path.addCurveToPoint(CGPointMake(33.29, 17.5), controlPoint1: CGPointMake(32.62, 15.13), controlPoint2: CGPointMake(33.29, 16.13))
    kvg06570s4Path.addCurveToPoint(CGPointMake(33.19, 50.75), controlPoint1: CGPointMake(33.29, 18.37), controlPoint2: CGPointMake(33.19, 41.12))
    kvg06570s4Path.addCurveToPoint(CGPointMake(33.12, 54.5), controlPoint1: CGPointMake(33.19, 52.34), controlPoint2: CGPointMake(33.14, 53.63))
    pathes.append(kvg06570s4Path)
    
    
    //// kvg:06570-s5 Drawing
    var kvg06570s5Path = UIBezierPath()
    kvg06570s5Path.moveToPoint(CGPointMake(32.5, 35))
    kvg06570s5Path.addCurveToPoint(CGPointMake(31.57, 37.65), controlPoint1: CGPointMake(32.5, 36), controlPoint2: CGPointMake(31.91, 36.94))
    kvg06570s5Path.addCurveToPoint(CGPointMake(16.25, 55), controlPoint1: CGPointMake(28.28, 44.54), controlPoint2: CGPointMake(22.37, 50.69))
    pathes.append(kvg06570s5Path)
    
    
    //// kvg:06570-s6 Drawing
    var kvg06570s6Path = UIBezierPath()
    kvg06570s6Path.moveToPoint(CGPointMake(36.5, 41))
    kvg06570s6Path.addCurveToPoint(CGPointMake(47.75, 49.25), controlPoint1: CGPointMake(40, 42.25), controlPoint2: CGPointMake(45.25, 45.75))
    pathes.append(kvg06570s6Path)
    
    
    
    
    //// kvg:06570-g3
    //// kvg:06570-s7 Drawing
    var kvg06570s7Path = UIBezierPath()
    kvg06570s7Path.moveToPoint(CGPointMake(30.25, 58.25))
    kvg06570s7Path.addCurveToPoint(CGPointMake(30.63, 61.33), controlPoint1: CGPointMake(30.63, 59), controlPoint2: CGPointMake(30.82, 60.24))
    kvg06570s7Path.addCurveToPoint(CGPointMake(21.88, 79.6), controlPoint1: CGPointMake(29.66, 66.69), controlPoint2: CGPointMake(26.15, 73.33))
    kvg06570s7Path.addCurveToPoint(CGPointMake(22.76, 81.51), controlPoint1: CGPointMake(21, 80.89), controlPoint2: CGPointMake(22.25, 81.46))
    kvg06570s7Path.addCurveToPoint(CGPointMake(41.4, 87.28), controlPoint1: CGPointMake(28.28, 81.98), controlPoint2: CGPointMake(36.35, 84.22))
    kvg06570s7Path.addCurveToPoint(CGPointMake(45.51, 90.76), controlPoint1: CGPointMake(43.12, 88.32), controlPoint2: CGPointMake(44.55, 89.49))
    pathes.append(kvg06570s7Path)
    
    
    //// kvg:06570-s8 Drawing
    var kvg06570s8Path = UIBezierPath()
    kvg06570s8Path.moveToPoint(CGPointMake(44, 63.25))
    kvg06570s8Path.addCurveToPoint(CGPointMake(44.33, 67.39), controlPoint1: CGPointMake(44.75, 64.5), controlPoint2: CGPointMake(44.64, 66.27))
    kvg06570s8Path.addCurveToPoint(CGPointMake(16.5, 96.5), controlPoint1: CGPointMake(41.81, 76.44), controlPoint2: CGPointMake(34.53, 89.77))
    pathes.append(kvg06570s8Path)
    
    
    //// kvg:06570-s9 Drawing
    var kvg06570s9Path = UIBezierPath()
    kvg06570s9Path.moveToPoint(CGPointMake(13.5, 70.4))
    kvg06570s9Path.addCurveToPoint(CGPointMake(17.25, 71.34), controlPoint1: CGPointMake(14.25, 71.09), controlPoint2: CGPointMake(15.25, 71.53))
    kvg06570s9Path.addCurveToPoint(CGPointMake(49.25, 66.09), controlPoint1: CGPointMake(21, 70.99), controlPoint2: CGPointMake(40.34, 67.85))
    pathes.append(kvg06570s9Path)
    
    
    //// kvg:06570-g4
    //// kvg:06570-g5
    //// kvg:06570-s10 Drawing
    var kvg06570s10Path = UIBezierPath()
    kvg06570s10Path.moveToPoint(CGPointMake(65.75, 16.25))
    kvg06570s10Path.addCurveToPoint(CGPointMake(65.92, 19.88), controlPoint1: CGPointMake(66.12, 17.37), controlPoint2: CGPointMake(66.23, 18.63))
    kvg06570s10Path.addCurveToPoint(CGPointMake(52.75, 51.62), controlPoint1: CGPointMake(63.5, 29.75), controlPoint2: CGPointMake(60.05, 40.58))
    pathes.append(kvg06570s10Path)
    
    
    //// kvg:06570-s11 Drawing
    var kvg06570s11Path = UIBezierPath()
    kvg06570s11Path.moveToPoint(CGPointMake(63.92, 37.46))
    kvg06570s11Path.addCurveToPoint(CGPointMake(67.27, 37.36), controlPoint1: CGPointMake(64.75, 37.5), controlPoint2: CGPointMake(66.4, 37.47))
    kvg06570s11Path.addCurveToPoint(CGPointMake(88.4, 33.77), controlPoint1: CGPointMake(74.25, 36.5), controlPoint2: CGPointMake(80.75, 34.75))
    kvg06570s11Path.addCurveToPoint(CGPointMake(91.32, 33.85), controlPoint1: CGPointMake(89.95, 33.57), controlPoint2: CGPointMake(90.92, 33.75))
    pathes.append(kvg06570s11Path)
    
    
    
    //// kvg:06570-g6
    //// kvg:06570-g7
    //// kvg:06570-s12 Drawing
    var kvg06570s12Path = UIBezierPath()
    kvg06570s12Path.moveToPoint(CGPointMake(79.23, 40.01))
    kvg06570s12Path.addCurveToPoint(CGPointMake(79.23, 45.27), controlPoint1: CGPointMake(79.73, 41.35), controlPoint2: CGPointMake(79.75, 42.81))
    kvg06570s12Path.addCurveToPoint(CGPointMake(48.76, 94), controlPoint1: CGPointMake(74.51, 67.58), controlPoint2: CGPointMake(65.28, 86.9))
    pathes.append(kvg06570s12Path)
    
    
    
    //// kvg:06570-s13 Drawing
    var kvg06570s13Path = UIBezierPath()
    kvg06570s13Path.moveToPoint(CGPointMake(56.5, 54.75))
    kvg06570s13Path.addCurveToPoint(CGPointMake(85.49, 87.5), controlPoint1: CGPointMake(59.16, 54.75), controlPoint2: CGPointMake(75.41, 77.24))
    kvg06570s13Path.addCurveToPoint(CGPointMake(93.25, 92.5), controlPoint1: CGPointMake(87.7, 89.75), controlPoint2: CGPointMake(89.96, 92.15))
    
    pathes.append(kvg06570s13Path)
    
    return pathes
  }()
  
  let color0 = UIColor(red:0.95, green:0, blue:0.63, alpha:1)
  let color1 = UIColor(red:0.63, green:0, blue:0.95, alpha:1)
  let color2 = UIColor(red:0.23, green:0.7, blue:0.96, alpha:1)
  
}
