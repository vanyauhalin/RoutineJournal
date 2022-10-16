import SwiftUI

class VStretchable: ObservableObject {
  private let row: VStretchableRow
  private let container: VStretchableContainer
  private let content: VStretchableContent
  private let translation: VStretchableTranslation

  @Published var containerHeight = CGFloat.zero
  @Published var contentCenterOffset = CGFloat.zero

  init(rowHeight: CGFloat, rowCount: Int, rowSelection: Int) {
    self.row = VStretchableRow(
      height: rowHeight,
      count: rowCount,
      selection: rowSelection
    )
    self.container = VStretchableContainer(
      row: self.row
    )
    self.content = VStretchableContent(
      row: self.row,
      container: self.container
    )
    self.translation = VStretchableTranslation(
      container: self.container,
      content: self.content
    )

    self.container.willSetHeight { containerHeight in
      self.containerHeight = containerHeight
    }
    self.content.center.willSetOffset { contentCenterOffset in
      self.contentCenterOffset = contentCenterOffset
    }

    self.handleCloseStabilization()
  }
}

extension VStretchable {
  func onChange(height: CGFloat) {
    guard height != translation.previousHeight else { return }
    translation.updateDirection(height: height)
    switch translation.direction {
      case .bottom:
        handleOpen(height: height)
      case .top:
        handleClose(height: height)
    }
    translation.store(height: height)
  }

  func onEnded() {
    if container.crossedThreshold() {
      handleOpenStabilization()
    } else {
      handleCloseStabilization()
    }
    translation.resetHeight()
  }
}

extension VStretchable {
  private func handleOpen(height: CGFloat) {
    guard !container.opened else { return }
    switch translation.type {
      case .evenly:
        handleOpenEvenly(height: height)
      case .unevenly:
        handleOpenUnevenly(height: height)
    }
  }

  private func handleOpenEvenly(height: CGFloat) {
    let additionalHeight = height - translation.previousHeight
    let expectedHeight = container.height + additionalHeight
    container.height = expectedHeight > container.maximumHeight
    ? container.maximumHeight
    : expectedHeight
  }

  private func handleOpenUnevenly(height: CGFloat) {
    let additionalHeight = height - translation.previousHeight
    let expectedHeight = container.height + additionalHeight
    if expectedHeight > container.unevenlyTranslationMaximumHeight {
      handleOpenWithTransition(height: height)
      return
    }
    container.height = expectedHeight
    content.center.offset -= additionalHeight * content.translation.ratio
  }

  private func handleOpenWithTransition(height: CGFloat) {
    let additionalHeight = content.center.offset
    * content.translation.coefficient
    container.height += additionalHeight
    content.center.finalizeOffset()
    translation.update(height: additionalHeight)
    handleOpenEvenly(height: height)
  }

  private func handleOpenStabilization() {
    container.finalizeHeight()
    content.center.finalizeOffset()
  }
}

extension VStretchable {
  private func handleClose(height: CGFloat) {
    guard !container.closed else { return }
    switch translation.type {
      case .evenly:
        handleCloseEvenly(height: height)
      case .unevenly:
        handleCloseUnevenly(height: height)
    }
  }

  private func handleCloseEvenly(height: CGFloat) {
    let extraHeight = translation.previousHeight - height
    let expectedHeight = container.height - extraHeight
    if
      expectedHeight > container.unevenlyTranslationMinimumHeight
        && expectedHeight < container.unevenlyTranslationMaximumHeight
    {
      handleCloseWithTransition(height: height)
      return
    }
    if expectedHeight < container.minimumHeight {
      handleCloseStabilization()
      return
    }
    container.height = expectedHeight
  }

  private func handleCloseUnevenly(height: CGFloat) {
    let extraHeight = translation.previousHeight - height
    let expectedHeight = container.height - extraHeight
    container.height = expectedHeight
    content.center.offset += extraHeight * content.translation.ratio
  }

  private func handleCloseWithTransition(height: CGFloat) {
    let extraHeight = height - container.unevenlyTranslationMaximumHeight
    container.height -= extraHeight
    content.center.offset = extraHeight * content.translation.ratio
    translation.update(height: -extraHeight)
    handleCloseUnevenly(height: height)
  }

  private func handleCloseStabilization() {
    container.resetHeight()
    content.center.resetOffset()
  }
}
