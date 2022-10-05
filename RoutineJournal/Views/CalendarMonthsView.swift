import SwiftUI

struct CalendarMonthsView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthsViewModel
  @ObservedObject var evenlyViewModel: SpaceEvenlyViewModel
  @ViewBuilder var content: (CalendarMonthViewModel) -> Content

  var body: some View {
    SpaceEvenlyContainerView(viewModel: evenlyViewModel) {
      TabView(selection: $viewModel.monthViewModelSelection) {
        ForEach(
          Array(viewModel.monthViewModels.enumerated()),
          id: \.offset
        ) { index, monthViewModel in
          content(monthViewModel)
            .tag(index)
            .onDisappear {
              viewModel.loadMonthView()
            }
        }
      }
      .id(viewModel.monthViewModels.count)
      .tabViewStyle(.page(indexDisplayMode: .never))
    }
  }
}
