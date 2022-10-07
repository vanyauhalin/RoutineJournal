import SwiftUI

class VStretchable: ObservableObject {
  private let rowHeight: CGFloat
  private let rowCount: Int
  private let rowSelection: Int

  private var containerPreviousHeight = CGFloat.zero
  private var containerDefaultHeight: CGFloat {
    rowHeight * CGFloat(rowCount)
  }
  private var containerMaximumHeight: CGFloat {
    containerDefaultHeight + rowHeight * 4
  }
  private var containerThresholdHeight: CGFloat {
    containerDefaultHeight / 2
  }

  private var contentMinimumOffset = CGFloat.zero
  private var firstRowOffset: CGFloat {
    (containerDefaultHeight - rowHeight) / 2
  }
  private var selectedRowMargin: CGFloat {
    rowHeight * CGFloat(rowSelection)
  }
  private var selectedRowOffset: CGFloat {
    firstRowOffset - selectedRowMargin
  }
  private var selectedRowOffsetLimit: CGFloat {
    selectedRowOffset + selectedRowMargin / 2
  }

  private var toOpen = false
  private var moreTopRow: Bool {
    Float(rowSelection) >= Float(containerHeight / rowHeight - 1) / 2
  }

  @Published var containerHeight = CGFloat.zero
  @Published var contentOffset = CGFloat.zero

  init(
    height: CGFloat,
    count: Int,
    selection: Int
  ) {
    self.rowHeight = height
    self.rowCount = count
    self.rowSelection = selection
    self.presetOffset()
    self.presetHeight()
  }
}

extension VStretchable {
  private func presetOffset() {
    contentOffset = selectedRowOffset
  }

  private func presetHeight() {
    containerHeight = rowHeight
  }
}

extension VStretchable {
  func onChange(height: CGFloat) {
    toOpen = height > containerPreviousHeight

    if toOpen {
      handleOpen(height: height)
    }

    containerPreviousHeight = height
  }
}

extension VStretchable {
  private func handleOpen(height: CGFloat) {
    if containerHeight == containerMaximumHeight {
      return
    }

    if contentOffset == contentMinimumOffset || moreTopRow {
      handleOpenEvenly(height: height)
      return
    }

    handleOpenUnevenly(height: height)
  }

  private func handleOpenEvenly(height: CGFloat) {
    let additionalHeight = height - containerPreviousHeight
    let expectedHeight = containerHeight + additionalHeight
    containerHeight = expectedHeight > containerMaximumHeight
    ? containerMaximumHeight
    : containerHeight + additionalHeight
  }

  private func handleOpenUnevenly(height: CGFloat) {
    let additionalHeight = height - containerPreviousHeight
    let additionalOffset = additionalHeight / 2
    let currentCenter = containerHeight / 2
    let shiftedCenter = (containerHeight + additionalOffset) / 2
    let centerOffset = shiftedCenter - currentCenter
    let expectedOffset = contentOffset - centerOffset

    if expectedOffset >= contentMinimumOffset {
      contentOffset = expectedOffset
      containerHeight += additionalHeight
      return
    }

    handleOpenTransition(height: height)
  }

  private func handleOpenTransition(height: CGFloat) {
    let currentCenter = containerHeight / 2
    let centerOffset = contentOffset
    let shiftedOffset = currentCenter + centerOffset
    let additionalOffset = shiftedOffset * 2 - containerHeight
    let additionalHeight = additionalOffset * 2
    contentOffset = contentMinimumOffset
    containerHeight += additionalHeight
    containerPreviousHeight += additionalHeight
    handleOpenEvenly(height: height)
  }

  private func handleOpenReturn() {
    contentOffset = contentMinimumOffset
    containerHeight = containerDefaultHeight
  }
}

extension VStretchable {
  func onEnded() {
    if contentOffset == contentMinimumOffset {
      handleOpenReturn()
      return
    }

    if containerHeight >= containerThresholdHeight {
      handleOpenReturn()
    }
  }
}
