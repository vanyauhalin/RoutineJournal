import SwiftUI

class VStretchableRow {
  let height: CGFloat
  var count: Int
  let selection: Int

  var last: Int {
    count - 1
  }
  var center: Float {
    Float(last / 2)
  }
  var abs: Int {
    Float(selection) > center ? last - selection : selection
  }

  init(height: CGFloat, count: Int, selection: Int) {
    self.height = height
    self.count = count
    self.selection = selection
  }
}
