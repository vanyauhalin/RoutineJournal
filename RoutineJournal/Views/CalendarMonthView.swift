import SwiftUI

struct CalendarMonthView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthViewModel
  @ObservedObject var evenlyViewModel: SpaceEvenlyViewModel
  @ViewBuilder var content: (CalendarDayViewModel) -> Content

  var body: some View {
    SpaceEvenlyView(spacing: evenlyViewModel.spacing) {
      LazyVGrid(columns: evenlyViewModel.columns, spacing: 4) {
        ForEach(viewModel.dayViewModels, id: \.day.date) { dayViewModel in
          content(dayViewModel)
        }
      }
    }
  }
}
