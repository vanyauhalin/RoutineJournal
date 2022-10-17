import SwiftUI

class VStretchable: ObservableObject {
  private let row: VStretchableRow
  private let container: VStretchableContainer
  private let content: VStretchableContent
  private let gesture: VStretchableGesture

  @Published var containerHeight = CGFloat.zero
  @Published var contentCenterOffset = CGFloat.zero

  init(rowHeight: CGFloat, rowCount: Int, rowSelection: Int) {
    self.row = .init(
      height: rowHeight,
      count: rowCount,
      selection: rowSelection
    )
    self.container = .init(row: self.row)
    self.content = .init(row: self.row, container: self.container)
    self.gesture = .init(container: self.container, content: self.content)

    self.container.willSetHeight { containerHeight in
      self.containerHeight = containerHeight
    }
    self.content.willSetOffset { contentCenterOffset in
      self.contentCenterOffset = contentCenterOffset
    }

    self.handleCloseStabilization()
  }
}

extension VStretchable {
  func onChange(height: CGFloat) {
    guard height != gesture.translation.previousHeight else { return }
    gesture.updateDirection(height: height)
    switch gesture.direction {
      case .bottom:
        handleOpen(height: height)
      case .top:
        handleClose(height: height)
    }
    gesture.translation.store(height: height)
  }

  func onEnded() {
    if container.crossedThreshold() {
      handleOpenStabilization()
    } else {
      handleCloseStabilization()
    }
    gesture.translation.resetHeight()
  }
}

extension VStretchable {
  private func handleOpen(height: CGFloat) {
    guard !container.opened else { return }
    switch gesture.translation.type {
      case .evenly:
        handleOpenEvenly(height: height)
      case .unevenly:
        handleOpenUnevenly(height: height)
    }
  }

  private func handleOpenEvenly(height: CGFloat) {
    let additionalHeight = height - gesture.translation.previousHeight
    let expectedHeight = container.height + additionalHeight
    container.height = expectedHeight > container.maximumHeight
    ? container.maximumHeight
    : expectedHeight
  }

  private func handleOpenUnevenly(height: CGFloat) {
    let additionalHeight = height - gesture.translation.previousHeight
    let expectedHeight = container.height + additionalHeight
    if expectedHeight > container.maximumHeight {
      handleOpenWithTransition(height: height)
      return
    }
    container.height = expectedHeight
    content.offset -= additionalHeight * gesture.translation.ratio
  }

  private func handleOpenWithTransition(height: CGFloat) {
    let additionalHeight = content.offset * gesture.translation.coefficient
    container.height += additionalHeight
    content.open()
    gesture.translation.update(height: additionalHeight)
    handleOpenEvenly(height: height)
  }

  private func handleOpenStabilization() {
    container.open()
    content.open()
  }
}

extension VStretchable {
  private func handleClose(height: CGFloat) {
    guard !container.closed else { return }
    switch gesture.translation.type {
      case .evenly:
        handleCloseEvenly(height: height)
      case .unevenly:
        handleCloseUnevenly(height: height)
    }
  }

  private func handleCloseEvenly(height: CGFloat) {
    let extraHeight = gesture.translation.previousHeight - height
    let expectedHeight = container.height - extraHeight
    if expectedHeight < container.maximumHeight {
      handleCloseWithTransition(height: height)
      return
    }
    container.height = expectedHeight
  }

  private func handleCloseUnevenly(height: CGFloat) {
    let extraHeight = gesture.translation.previousHeight - height
    let expectedHeight = container.height - extraHeight
    if expectedHeight < container.minimumHeight {
      handleCloseStabilization()
      return
    }
    container.height = expectedHeight
    content.offset += extraHeight * gesture.translation.ratio
  }

  private func handleCloseWithTransition(height: CGFloat) {
    let extraHeight = height - container.maximumHeight
    container.height -= extraHeight
    content.offset = extraHeight * gesture.translation.ratio
    gesture.translation.update(height: -extraHeight)
    handleCloseUnevenly(height: height)
  }

  private func handleCloseStabilization() {
    container.close()
    content.close()
  }
}

extension VStretchable {
  func set(rowCount: Int) {
    row.count = rowCount
    withAnimation {
      handleOpenStabilization()
    }
  }
}
