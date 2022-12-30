#if DEBUG
import SwiftUI

extension PreviewContext {
  public struct Container<Content>: View where Content: View {
    public let position: Position
    public let content: Content

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
      VStack(spacing: .zero) {
        if bottom {
          Spacer(minLength: .zero)
        }
        HStack(spacing: .zero) {
          if trailing {
            Spacer(minLength: .zero)
          }
          VStack(alignment: .leading, spacing: .zero) {
            content
              .font(.footnote.monospaced())
          }
          if leading {
            Spacer(minLength: .zero)
          }
        }
        if top {
          Spacer(minLength: .zero)
        }
      }
    }

    public init(_ position: Position, @ViewBuilder content: () -> Content) {
      self.position = position
      self.content = content()
    }
  }
}
#endif
