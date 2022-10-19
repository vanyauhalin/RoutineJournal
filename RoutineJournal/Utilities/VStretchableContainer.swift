import SwiftUI

class VStretchableContainer {
  private let row: VStretchableRow

  private var willSetHeightCallback: ((CGFloat) -> Void)?
  private var didSetHeightCallback: (() -> Void)?
  var height = CGFloat.zero {
    willSet {
      guard let callback = willSetHeightCallback else { return }
      callback(newValue)
    }
    didSet {
      guard let callback = didSetHeightCallback else { return }
      callback()
    }
  }

  init(row: VStretchableRow) {
    self.row = row
  }
}

extension VStretchableContainer {
  var naturalMaximumHeight: CGFloat {
    row.height * CGFloat(row.count)
  }
  var thresholdHeight: CGFloat {
    naturalMaximumHeight / 2
  }
  var minimumHeight: CGFloat {
    row.height
  }
  var maximumHeight: CGFloat {
    naturalMaximumHeight + row.height * 3
  }
  var closed: Bool {
    height == minimumHeight
  }
  var naturalized: Bool {
    height == naturalMaximumHeight
  }
  var opened: Bool {
    height == maximumHeight
  }
}

extension VStretchableContainer {
  func willSetHeight(_ callback: @escaping (CGFloat) -> Void) {
    self.willSetHeightCallback = callback
  }
  func didSetHeight(_ callback: @escaping () -> Void) {
    self.didSetHeightCallback = callback
  }
  func crossedThreshold() -> Bool {
    height >= thresholdHeight
  }
  func close() {
    height = minimumHeight
  }
  func open() {
    height = naturalMaximumHeight
  }
}
