//
//  ViewController.swift
//  StrokeDrawingView
//
//  Created by Andriy K. on 12/01/2015.
//  Copyright (c) 2015 Andriy K.. All rights reserved.
//

import UIKit
import StrokeDrawingView

class ViewController: UIViewController {
  
  let pathes: [UIBezierPath] = {
    
    func parseG(g: XMLIndexer) -> [String] {
      var allPathes = [String]()
      let pathes = g["path"].all
      for path in pathes {
        if let d = path.element?.attributes["d"] {
          allPathes.append(d)
        }
      }
      
      let subGs = g["g"].all
      for subG in subGs {
        let subPathes = parseG(subG)
        allPathes += subPathes
      }
      
      return allPathes
    }
    
    let filePath = NSBundle.mainBundle().pathForResource("数", ofType: "svg")!
    var text = try! String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
    let xml = SWXMLHash.parse(text)
    let g = xml["svg"]["g"].all.first!
    let pathesStrings = parseG(g)
    
    var pathes = [UIBezierPath]()
    for pathString in pathesStrings {
      let path = UIBezierPath(svgPath: pathString)
      path.lineWidth = 3
      pathes.append(path)
    }
    
    return pathes
  }()
  
  
  @IBOutlet weak var strokedView: StrokeDrawingView! {
    didSet {
//      strokedView.dataSource = self
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    strokedView.playForever(2)
    performWithDelay(4) { () -> Void in
      self.strokedView.stopForeverAnimation()
    }
    
    performWithDelay(6) { () -> Void in
      self.strokedView.playForever(2)
    }
  }
  
}

extension ViewController: StrokeDrawingViewDataSource {
  func sizeOfDrawing() -> CGSize {
    return CGSize(width: 109, height: 109)
  }
  
  func numberOfStrokes() -> Int {
    return pathes.count
  }
  
  func pathForIndex(index: Int) -> UIBezierPath {
    return pathes[index]
  }
  
  func animationDurationForStroke(index: Int) -> CFTimeInterval {
    return 0.5
  }
  
  func colorForStrokeAtIndex(index: Int) -> UIColor {
    return UIColor.darkGrayColor()
  }
}

