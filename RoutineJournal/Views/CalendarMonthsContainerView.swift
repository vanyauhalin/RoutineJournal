import SwiftUI

struct CalendarMonthsContainerView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthsViewModel
  @ViewBuilder let content: (VStretchable) -> Content

  var body: some View {
    ZStack {
      ZStack {
        VSpaceableContainerView(spaceable: viewModel.month) {
          Color.clear
        }
        .onAppear {
          viewModel.preload()
        }
      }
      .padding()
      .frame(width: UIScreen.main.bounds.width, height: 0)
      .hidden()

      if let container = viewModel.container {
        content(container)
      }
    }
  }
}
