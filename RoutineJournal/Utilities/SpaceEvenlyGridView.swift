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

  init(
    columnCount: Int,
    content: @escaping (SpaceEvenlyGridViewModel) -> Content
  ) {
    self.viewModel = SpaceEvenlyGridViewModel(columnCount: columnCount)
    self.content = content
  }
}

struct SpaceEvenlyGridView_Previews: PreviewProvider {
  static var previews: some View {
    SpaceEvenlyGridView(columnCount: 7) { viewModel in
      Text("\(viewModel.spacing)")
    }
  }
}
