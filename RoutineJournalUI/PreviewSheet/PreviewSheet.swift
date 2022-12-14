#if DEBUG
import SwiftUI

public struct PreviewSheet<Content>: View where Content: View {
  @State private var showing = false
  @ViewBuilder public var content: (@escaping () -> Void) -> Content

  public var body: some View {
    Button("show") {
      showing.toggle()
    }
    .sheet(isPresented: $showing) {
      content(toggle)
    }
  }

  public init(
    @ViewBuilder content: @escaping (@escaping () -> Void) -> Content
  ) {
    self.content = content
  }

  public func toggle() {
    showing.toggle()
  }
}

struct PreviewSheet_Previews: PreviewProvider {
  static var previews: some View {
    PreviewSheet { toggle in
      Button("toggle") {
        toggle()
      }
    }
  }
}
#endif
