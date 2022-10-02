import SwiftUI

struct CalendarMonthsView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthsViewModel
  @ViewBuilder var content: (CalendarMonthViewModel) -> Content

  var body: some View {
    TabView(selection: $viewModel.selection) {
      ForEach(
        Array(viewModel.monthViewModels.enumerated()),
        id: \.offset
      ) { index, monthViewModel in
        content(monthViewModel)
          .tag(index)
          .onDisappear {
            viewModel.loadMonths()
          }
      }
    }
    .id(viewModel.monthViewModels.count)
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
}
