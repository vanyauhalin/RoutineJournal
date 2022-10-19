import SwiftUI

class VStretchableContent {
  private let row: VStretchableRow
  private let container: VStretchableContainer

  private var willSetOffsetCallback: ((CGFloat) -> Void)?
  var offset = CGFloat.zero {
    willSet {
      guard let callback = willSetOffsetCallback else { return }
      callback(newValue)
    }
  }

  private let naturalOffset = CGFloat.zero
  var selectionOffset: CGFloat {
    let firstOffset = (container.naturalMaximumHeight - row.height) / 2
    let selectionMargin = row.height * CGFloat(row.selection)
    return firstOffset - selectionMargin
  }

  init(row: VStretchableRow, container: VStretchableContainer) {
    self.row = row
    self.container = container
  }

  func willSetOffset(_ callback: @escaping (CGFloat) -> Void) {
    self.willSetOffsetCallback = callback
  }
  func close() {
    offset = selectionOffset
  }
  func open() {
    offset = naturalOffset
  }
}
