//
//  Kanji.swift
//  StrokeDrawingView
//
//  Created by Andrii Kharchyshyn on 5/3/17.
//  Copyright © 2017 @haawa799. All rights reserved.
//

import UIKit
import KanjiBezierPaths

struct Kanji {
    
    static let kanjiProvider = KanjiProvider()
    
    let color0 = UIColor(red:0.95, green:0, blue:0.63, alpha:1)
    let color1 = UIColor(red:0.63, green:0, blue:0.95, alpha:1)
    let color2 = UIColor(red:0.23, green:0.7, blue:0.96, alpha:1)
    
    
    let bezierPathes: [UIBezierPath]
    let kanji: String
    
    init(kanji: String) {
        self.kanji = kanji
        self.bezierPathes = Kanji.kanjiProvider.pathesForKanji(kanji) ?? []
    }
    
}
