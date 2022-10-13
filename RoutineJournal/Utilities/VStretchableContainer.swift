import SwiftUI

class VStretchableContainer {
  private let row: VStretchableRow

  private var willSetHeightCallback: ((CGFloat) -> Void)?
  var height = CGFloat.zero {
    willSet {
      if let callback = willSetHeightCallback {
        callback(newValue)
      }
    }
  }

  var finalHeight: CGFloat {
    row.height * CGFloat(row.count)
  }
  var thresholdHeight: CGFloat {
    finalHeight / 2
  }
  var minimumHeight: CGFloat {
    row.height
  }
  var maximumHeight: CGFloat {
    finalHeight + row.height * 4
  }
  var unevenlyTranslationMinimumHeight: CGFloat {
    minimumHeight * CGFloat(row.abs * 2 + 1)
  }
  var unevenlyTranslationMaximumHeight: CGFloat {
    finalHeight + unevenlyTranslationMinimumHeight
  }
  var closed: Bool {
    height == minimumHeight
  }
  var opened: Bool {
    height == maximumHeight
  }

  init(row: VStretchableRow) {
    self.row = row
  }
}

extension VStretchableContainer {
  func willSetHeight(_ callback: @escaping (CGFloat) -> Void) {
    self.willSetHeightCallback = callback
  }

  func crossedThreshold() -> Bool {
    height >= thresholdHeight
  }

  func resetHeight() {
    height = minimumHeight
  }

  func finalizeHeight() {
    height = finalHeight
  }
}
