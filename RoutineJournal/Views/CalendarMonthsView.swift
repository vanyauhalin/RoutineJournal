import SwiftUI

// swiftlint:disable:next convenience_type
struct CalendarMonthsContainerView {
  static var width: CGFloat {
    UIScreen.main.bounds.width - LayoutSettings.padding * 2
  }
}

struct CalendarMonthsView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthsViewModel
  @ViewBuilder let content: (CalendarMonthViewModel, [GridItem]) -> Content

  var body: some View {
    VStretchableContainerView(viewModel: viewModel.monthsContainer) {
      TabView(selection: $viewModel.monthSelection) {
        ForEach(
          Array(viewModel.months.enumerated()),
          id: \.offset
        ) { index, month in
          VStretchableContentView(viewModel: viewModel.monthsContainer) {
            content(month, viewModel.monthContainer.columns)
              .tag(index)
              .padding([.horizontal])
              .onDisappear {
                viewModel.loadMonth()
              }
          }
        }
      }
      .id(viewModel.months.count)
      .tabViewStyle(.page(indexDisplayMode: .never))
    }
  }
}
