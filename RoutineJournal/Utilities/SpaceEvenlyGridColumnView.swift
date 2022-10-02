import SwiftUI

struct SpaceEvenlyGridColumnView<Content>: View where Content: View {
  let gridViewModel: SpaceEvenlyGridViewModel
  @ViewBuilder var content: () -> Content

  var body: some View {
    content()
      .readSize { size in
        gridViewModel.setColumnWidth(width: size.width)
      }
  }
}
