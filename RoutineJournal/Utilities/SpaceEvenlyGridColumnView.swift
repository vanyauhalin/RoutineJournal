import SwiftUI

struct SpaceEvenlyGridColumnView<Content>: View where Content: View {
  let viewModel: SpaceEvenlyGridViewModel
  @ViewBuilder var content: () -> Content

  var body: some View {
    content()
      .readSize { size in
        viewModel.setColumnWidth(width: size.width)
      }
  }
}
