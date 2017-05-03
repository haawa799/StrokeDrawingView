//
//  ViewController.swift
//  Example
//
//  Created by Andrii Kharchyshyn on 5/2/17.
//  Copyright © 2017 @haawa799. All rights reserved.
//

import UIKit
import StrokeDrawingView

class ViewController: UIViewController {
    
    let kanji = Kanji(kanji: "数")
    var shouldPlay = true
    
    @IBOutlet weak var strokedView: StrokeDrawingView! {
        didSet {
            self.strokedView.dataSource = self
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if shouldPlay == true {
            strokedView.playForever(delayBeforeEach: 2)
            shouldPlay = false
        }
    }
}

extension ViewController: StrokeDrawingViewDataSource {
    func sizeOfDrawing() -> CGSize {
        return CGSize(width: 109, height: 109)
    }
    
    func numberOfStrokes() -> Int {
        return kanji.bezierPathes.count
    }
    
    func pathForIndex(index: Int) -> UIBezierPath {
        let path = kanji.bezierPathes[index]
        path.lineWidth = 3
        return path
    }
    
    func animationDurationForStroke(index: Int) -> CFTimeInterval {
        return 0.5
    }
    
    func colorForStrokeAtIndex(index: Int) -> UIColor {
        switch index {
        case 0...5: return kanji.color0
        case 5...8: return kanji.color1
        default: return kanji.color2
        }
    }
    
    func colorForUnderlineStrokes() -> UIColor? {
        return UIColor.lightGray
    }
    
}
