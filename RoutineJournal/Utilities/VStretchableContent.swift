import SwiftUI

class VStretchableContent {
  enum Direction {
    case top
    case bottom
    case center
  }

  private let row: VStretchableRow
  private let container: VStretchableContainer
  let center: Center
  let translation: Translation

  var direction: Direction {
    let center = Float(row.center)
    let selection = Float(row.selection)
    if selection < center {
      return .bottom
    }
    if selection > center {
      return .top
    }
    return .center
  }

  init(row: VStretchableRow, container: VStretchableContainer) {
    self.row = row
    self.container = container
    self.center = Center(row: row, container: container)
    self.translation = Translation(container: container, center: self.center)
  }
}

extension VStretchableContent {
  class Center {
    private let row: VStretchableRow
    private let container: VStretchableContainer

    private var willSetOffsetCallback: ((CGFloat) -> Void)?
    var offset = CGFloat.zero {
      willSet {
        if let callback = willSetOffsetCallback {
          callback(newValue)
        }
      }
    }

    let finalOffset = CGFloat.zero
    var selectionOffset: CGFloat {
      let firstCenterOffset = (container.finalHeight - row.height) / 2
      let selectionCenterMargin = row.height * CGFloat(row.selection)
      return firstCenterOffset - selectionCenterMargin
    }

    init(row: VStretchableRow, container: VStretchableContainer) {
      self.row = row
      self.container = container
    }

    func willSetOffset(_ callback: @escaping (CGFloat) -> Void) {
      self.willSetOffsetCallback = callback
    }

    func resetOffset() {
      offset = selectionOffset
    }

    func finalizeOffset() {
      offset = finalOffset
    }
  }
}

extension VStretchableContent {
  class Translation {
    private let container: VStretchableContainer
    private let center: Center

    var coefficient: CGFloat {
      (container.unevenlyTranslationMaximumHeight
       - container.unevenlyTranslationMinimumHeight)
      / center.selectionOffset
    }
    var ratio: CGFloat {
      1 / coefficient
    }

    init(container: VStretchableContainer, center: Center) {
      self.container = container
      self.center = center
    }
  }
}
