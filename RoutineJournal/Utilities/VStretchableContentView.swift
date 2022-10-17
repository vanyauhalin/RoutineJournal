import SwiftUI

struct VStretchableContentView<Content>: View where Content: View {
  @ObservedObject var viewModel: VStretchable
  @ViewBuilder let content: () -> Content

  var body: some View {
    content()
      .offset(y: viewModel.contentOffset)
  }
}
