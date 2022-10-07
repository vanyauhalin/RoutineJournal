import SwiftUI

struct VStretchableContainer<Content>: View where Content: View {
  @ObservedObject var viewModel: VStretchable
  @ViewBuilder let content: () -> Content

  var body: some View {
    content()
      .frame(height: viewModel.containerHeight)
      .gesture(
        DragGesture()
          .onChanged { value in
            withAnimation {
              viewModel.onChange(height: value.translation.height)
            }
          }
          .onEnded { _ in
            withAnimation {
              viewModel.onEnded()
            }
          }
      )
  }
}
