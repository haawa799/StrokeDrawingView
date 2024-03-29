# StrokeDrawingView 🖌🎨🈲

[![Build Status](https://travis-ci.org/haawa799/StrokeDrawingView.svg?branch=master)](https://travis-ci.org/haawa799/StrokeDrawingView)
[![License](https://img.shields.io/cocoapods/l/StrokeDrawingView.svg?style=flat)](http://cocoapods.org/pods/StrokeDrawingView)
[![Platform](https://img.shields.io/cocoapods/p/StrokeDrawingView.svg?style=flat)](http://cocoapods.org/pods/StrokeDrawingView)

#### ```StrokeDrawingView``` allows you to display stroke-by-stroke drawing. All you need to provide is and array of ```UIBezierPath```.



## Result

![StrokeDrawingView demo](screenshot.png)

## Usage

#### 0. Import

```swift
import StrokeDrawingView
```

#### 1. Create a StrokeDrawingView

###### In code :

```swift
let drawingView = StrokeDrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
```

###### Or use it from storyboard as an outlet :

```swift
@IBOutlet weak var drawingView: StrokeDrawingView!
```

#### 2. Set it's ```datasource```

```swift
strokedView.dataSource = self
```

#### 3. Implement ```datasource``` methods

```swift
extension ViewController: StrokeDrawingViewDataSource {

  // For proper view scaling
  func sizeOfDrawing() -> CGSize {
    return CGSize(width: 100, height: 100) // size of your drawing
  }

  // Number of strokes (UIBezierPathes) that your drawing has
  func numberOfStrokes() -> Int {
    return bezierPathes.count
  }

  // Provide your strokes here
  func pathForIndex(index: Int) -> UIBezierPath {
    let path = bezierPathes[index]
    path.lineWidth = 3  // lineWidth of each UIBezierPath is used when drawn
    return path
  }

  // You can set different duration for each stroke (eg. based on the length of each one)
  func animationDurationForStroke(index: Int) -> CFTimeInterval {
    return 0.5
  }

  // You can specify different colors for your strokes
  func colorForStrokeAtIndex(index: Int) -> UIColor {
    switch index {
      case 0...5: return color0
      case 5...8: return color1
      default: return color2
    }
  }
}
```

#### 4. Use following methods to control animation
```swift
  /// Use this method to run looped animation
  func playForever(delayBeforeEach: CFTimeInterval = 0) {

  /// Use this method to stop looped animation
  public func stopForeverAnimation()

  /// Use this method to run single animation cycle
  public func playSingleAnimation()

  /// Use this method to reset all strokes layers progress to 'progress'
  /// Can be value from 0 to 1
  public func setStrokesProgress(progress: CGFloat)
```

## Installation

StrokeDrawingView is available through Carthage.

## Author

Andriy Kharchyshyn., @haawa799

haawaplus@gmail.com

## License

StrokeDrawingView is available under the MIT license. See the LICENSE file for more info.
