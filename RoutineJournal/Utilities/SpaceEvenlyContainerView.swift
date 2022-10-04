import SwiftUI

struct SpaceEvenlyContainerView<Content>: View where Content: View {
  @StateObject var viewModel: SpaceEvenlyViewModel
  @ViewBuilder var content: () -> Content

  var body: some View {
    ZStack {
      content()
    }
    .readSize { size in
      viewModel.setContainer(width: size.width)
    }
    .onAppear {
      viewModel.updateSpacing()
      viewModel.updateColumns()
    }
  }
}
