import SwiftUI

class SpaceEvenlyGridViewModel: ObservableObject {
  private var containerWidth = CGFloat.zero
  private var columnWidth = CGFloat.zero
  let columnCount: Int
  @Published var columns: [GridItem] = []
  @Published var spacing = CGFloat.zero

  init(columnCount: Int) {
    self.columnCount = columnCount
    self.updateColumns()
  }
}

extension SpaceEvenlyGridViewModel {
  func setColumnWidth(width: CGFloat) {
    if width > columnWidth {
      columnWidth = width
    }
  }

  func setContainerWidth(width: CGFloat) {
    containerWidth = width
  }

  func updateSpacing() {
    spacing = (containerWidth - columnWidth * CGFloat(columnCount))
    / CGFloat(columnCount + 1)
  }

  func updateColumns() {
    columns = Array(
      repeating: .init(spacing: spacing),
      count: columnCount
    )
  }
}
