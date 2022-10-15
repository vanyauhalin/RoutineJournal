import SwiftUI

struct VSpaceableContainerView<Content>: View where Content: View {
  let spaceable: VSpaceable
  @ViewBuilder let content: () -> Content

  var body: some View {
    ZStack {
      content()
    }
    .readSize { size in
      spaceable.container.width = size.width
    }
  }
}
