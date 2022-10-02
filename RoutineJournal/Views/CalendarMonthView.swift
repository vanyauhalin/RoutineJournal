import SwiftUI

struct CalendarMonthView<Content>: View where Content: View {
  @ObservedObject var monthViewModel: CalendarMonthViewModel
  @ObservedObject var gridViewModel: SpaceEvenlyGridViewModel
  @ViewBuilder var content: (CalendarDayViewModel) -> Content

  var body: some View {
    SpaceEvenlyGridView(viewModel: gridViewModel) {
      LazyVGrid(columns: gridViewModel.columns, spacing: 4) {
        ForEach(monthViewModel.dayViewModels, id: \.day.date) { dayViewModel in
          SpaceEvenlyGridColumnView(viewModel: gridViewModel) {
            content(dayViewModel)
          }
        }
      }
    }
  }
}
