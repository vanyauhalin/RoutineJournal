import SwiftUI

class VSpaceable {
  private let containerWidth: CGFloat

  private let columnWidth: CGFloat
  private let columnCount: Int
  private var columnSpacing: CGFloat {
    (containerWidth - columnWidth * CGFloat(columnCount))
    / CGFloat(columnCount - 1)
  }
  private var column: GridItem {
    .init(spacing: columnSpacing)
  }

  var columns: [GridItem] {
    Array(repeating: column, count: columnCount)
  }

  init(containerWidth: CGFloat, columnWidth: CGFloat, columnCount: Int) {
    self.containerWidth = containerWidth
    self.columnWidth = columnWidth
    self.columnCount = columnCount
  }
}
