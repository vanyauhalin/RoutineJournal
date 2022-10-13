import SwiftUI

class VStretchableTranslation {
  enum Direction {
    case top
    case bottom
  }
  enum TranslationType {
    case evenly
    case unevenly
  }

  private let container: VStretchableContainer
  private let content: VStretchableContent

  private let defaultHeight = CGFloat.zero
  private var heightHistory: [CGFloat] = []
  private var previousPreviousHeight: CGFloat {
    heightHistory.first ?? defaultHeight
  }
  var previousHeight: CGFloat {
    heightHistory.last ?? defaultHeight
  }

  var direction = Direction.bottom
  var type: TranslationType {
    if container.height < container.unevenlyTranslationMinimumHeight {
      return .evenly
    }
    if container.height < container.unevenlyTranslationMaximumHeight {
      return .unevenly
    }
    return .evenly
  }

  init(container: VStretchableContainer, content: VStretchableContent) {
    self.container = container
    self.content = content
  }
}

extension VStretchableTranslation {
  func updateDirection(height: CGFloat) {
    let previous = height == previousHeight
    ? previousPreviousHeight
    : previousHeight
    direction = height > previous ? .bottom : .top
  }

  func store(height: CGFloat) {
    if heightHistory.count > 1 {
      heightHistory.removeFirst()
    }
    heightHistory.append(height)
  }

  func resetHeight() {
    store(height: defaultHeight)
  }

  func update(height: CGFloat) {
    store(height: previousHeight + height)
  }
}
