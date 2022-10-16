import SwiftUI

class VSpaceable {
  var containerWidth = CGFloat.zero

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

  init(columnWidth: CGFloat, columnCount: Int) {
    self.columnWidth = columnWidth
    self.columnCount = columnCount
  }
}
