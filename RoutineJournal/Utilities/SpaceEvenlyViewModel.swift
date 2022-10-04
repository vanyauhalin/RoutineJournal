import SwiftUI

class SpaceEvenlyViewModel: ObservableObject {
  private var containerWidth = CGFloat.zero
  private var columnWidth = CGFloat.zero
  let columnCount: Int
  @Published var columns: [GridItem] = []
  @Published var spacing = CGFloat.zero

  init(columnCount: Int, columnWidth: CGFloat) {
    self.columnCount = columnCount
    self.columnWidth = columnWidth
    self.updateColumns()
  }
}

extension SpaceEvenlyViewModel {
  func updateColumns() {
    columns = Array(
      repeating: .init(spacing: spacing),
      count: columnCount
    )
  }

  func setContainer(width: CGFloat) {
    containerWidth = width
  }

  func updateSpacing() {
    spacing = (containerWidth - columnWidth * CGFloat(columnCount))
    / CGFloat(columnCount + 1)
  }
}
