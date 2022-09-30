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

  init(
    gridViewModel: SpaceEvenlyGridViewModel,
    content: @escaping () -> Content
  ) {
    self.gridViewModel = gridViewModel
    self.content = content
  }
}

struct SpaceEvenlyElementView_Previews: PreviewProvider {
  static var previews: some View {
    SpaceEvenlyGridColumnView(
      gridViewModel: SpaceEvenlyGridViewModel(columnCount: 1)
    ) {
      Text("preview")
    }
  }
}
