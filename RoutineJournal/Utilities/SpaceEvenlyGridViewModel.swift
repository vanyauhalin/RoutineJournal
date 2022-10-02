import SwiftUI

class SpaceEvenlyGridViewModel: ObservableObject {
  private var containerWidth = CGFloat.zero
  private var columnWidth = CGFloat.zero
  let columnCount: Int
  @Published var columns: [GridItem] = []
  @Published var spacing = CGFloat.zero

  init(columnCount: Int) {
    self.columnCount = columnCount
    self.initColumns()
  }
}

extension SpaceEvenlyGridViewModel {
  private func initColumns() {
    columns = Array(
      repeating: .init(spacing: spacing),
      count: columnCount
    )
  }

  func updateColumns() {
    if let first = columns.first, first.spacing == .zero {
      initColumns()
    }
  }
}

extension SpaceEvenlyGridViewModel {
  func setColumnWidth(width: CGFloat) {
    if width > columnWidth {
      columnWidth = width
    }
  }

  func setContainerWidth(width: CGFloat) {
    if width > containerWidth {
      containerWidth = width
    }
  }

  func updateSpacing() {
    spacing = (containerWidth - columnWidth * CGFloat(columnCount))
    / CGFloat(columnCount + 1)
  }
}
