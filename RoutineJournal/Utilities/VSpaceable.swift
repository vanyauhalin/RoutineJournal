import SwiftUI

class VSpaceable {
  let container: Container
  let column: Column

  var columns: [GridItem] {
    Array(repeating: .init(spacing: column.spacing), count: column.count)
  }

  init(columnWidth width: CGFloat, columnCount count: Int) {
    self.container = Container()
    self.column = Column(container: self.container, width: width, count: count)
  }
}

extension VSpaceable {
  class Container {
    var width = CGFloat.zero
  }
}

extension VSpaceable {
  class Column {
    let container: Container
    let width: CGFloat
    let count: Int

    var spacing: CGFloat {
      return (container.width - width * CGFloat(count)) / CGFloat(count - 1)
    }

    init(container: Container, width: CGFloat, count: Int) {
      self.container = container
      self.width = width
      self.count = count
    }
  }
}
