//
//  KanjiBezierPathesHelper.swift
//  Pods
//
//  Created by Andriy K. on 12/25/15.
//
//

import UIKit

public class KanjiBezierPathesHelper {
  
  public static func pathesForKanji(kanji: String) -> [UIBezierPath]? {
    
//    NSString *bundlePath = [[NSBundle bundleForClass:[MyFrameworkClass class]]
//      pathForResource:@"MyResourceBundle" ofType:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];

//    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"MyResourceBundle" ofType:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    let podBundle = NSBundle(forClass: KanjiBezierPathesHelper.self)
    
    if let bundleURL = podBundle.URLForResource("KanjiBezierPaths", withExtension: "bundle") {
      
      if let bundle = NSBundle(URL: bundleURL) {
        
        guard let path = bundle.pathForResource(kanji, ofType: nil) else {
          return nil
        }
        
        if let result = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [UIBezierPath] {
          print(result)
          return result
        }
        
      }else {
        
        assertionFailure("Could not load the bundle")
        
      }
      
    }else {
      
      assertionFailure("Could not create a path to the bundle")
      
    }
    
    return nil
  }
  
}
