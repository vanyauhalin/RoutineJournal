import SwiftUI

struct SpaceEvenlyGridView<Content>: View where Content: View {
  @StateObject var viewModel: SpaceEvenlyGridViewModel
  @ViewBuilder var content: () -> Content

  var body: some View {
    HStack {
      Spacer(minLength: viewModel.spacing)
      content()
        .readSize { size in
          viewModel.setContainerWidth(width: size.width)
        }
        .onAppear {
          viewModel.updateSpacing()
          viewModel.updateColumns()
        }
      Spacer(minLength: viewModel.spacing)
    }
  }
}
