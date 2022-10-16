import SwiftUI

struct VSpaceableContainerView<Content>: View where Content: View {
  let viewModel: VSpaceable
  @ViewBuilder let content: () -> Content

  var body: some View {
    ZStack {
      content()
    }
    .readSize { size in
      viewModel.containerWidth = size.width
    }
  }
}
