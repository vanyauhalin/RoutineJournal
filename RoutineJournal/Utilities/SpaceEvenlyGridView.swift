import SwiftUI

struct SpaceEvenlyGridView<Content>: View where Content: View {
  @ObservedObject private var viewModel: SpaceEvenlyGridViewModel
  @ViewBuilder var content: (SpaceEvenlyGridViewModel) -> Content

  var body: some View {
    HStack {
      Spacer(minLength: viewModel.spacing)
      content(viewModel)
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
