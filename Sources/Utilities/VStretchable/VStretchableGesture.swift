import SwiftUI

class VStretchableGesture {
  private let container: VStretchableContainer
  private let content: VStretchableContent
  let translation: Translation
  var direction = Direction.bottom

  init(container: VStretchableContainer, content: VStretchableContent) {
    self.container = container
    self.content = content
    self.translation = .init(container: container, content: content)
  }
}

extension VStretchableGesture {
  enum Direction {
    case top
    case bottom
  }
  func updateDirection(height: CGFloat) {
    let previous = height == translation.previousHeight
    ? translation.previousPreviousHeight
    : translation.previousHeight
    direction = height > previous ? .bottom : .top
  }
}

extension VStretchableGesture {
  class Translation {
    private let container: VStretchableContainer
    private let content: VStretchableContent
    private let defaultHeight = CGFloat.zero
    private var heightHistory: [CGFloat] = [] {
      didSet {
        guard self.heightHistory.count > 2 else { return }
        self.heightHistory.removeFirst()
      }
    }

    init(container: VStretchableContainer, content: VStretchableContent) {
      self.container = container
      self.content = content
    }
  }
}

extension VStretchableGesture.Translation {
  var previousPreviousHeight: CGFloat {
    heightHistory.first ?? defaultHeight
  }
  var previousHeight: CGFloat {
    heightHistory.last ?? defaultHeight
  }

  func store(height: CGFloat) {
    heightHistory.append(height)
  }
  func resetHeight() {
    store(height: defaultHeight)
  }
  func update(height: CGFloat) {
    store(height: previousHeight + height)
  }
}

extension VStretchableGesture.Translation {
  enum TranslationType {
    case evenly
    case unevenly
  }
  var type: TranslationType {
    container.height > container.minimumHeight
    && container.height < container.naturalMaximumHeight
    ? .unevenly
    : .evenly
  }
}

extension VStretchableGesture.Translation {
  var coefficient: CGFloat {
    (container.naturalMaximumHeight - container.minimumHeight)
    / content.selectionOffset
  }
  var ratio: CGFloat {
    1 / coefficient
  }
}
