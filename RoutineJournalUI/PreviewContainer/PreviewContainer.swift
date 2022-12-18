#if DEBUG
import SwiftUI

public struct PreviewContainer<Content, Mirror>: View
where Content: View, Mirror: View {
  public let position: PreviewContainerPosition
  public let content: Content
  public let mirror: Mirror

  public var top: Bool {
    position.0 == .top
  }
  public var bottom: Bool {
    position.0 == .bottom
  }
  public var leading: Bool {
    position.1 == .leading
  }
  public var trailing: Bool {
    position.1 == .trailing
  }

  public var body: some View {
    ZStack {
      content
      VStack {
        if bottom {
          Spacer()
        }
        HStack {
          if trailing {
            Spacer()
          }
          mirror
          if leading {
            Spacer()
          }
        }
        if top {
          Spacer()
        }
      }
    }
  }

  public init(
    position: PreviewContainerPosition,
    @ViewBuilder content: () -> Content,
    @ViewBuilder mirror: () -> Mirror
  ) {
    self.position = position
    self.content = content()
    self.mirror = mirror()
  }
}

struct PreviewContainer_Previews: PreviewProvider {
  static var previews: some View {
    PreviewContainer(
      position: (.top, .leading),
      content: {
        Text("content")
      },
      mirror: {
        Text("mirror")
      }
    )
  }
}
#endif
