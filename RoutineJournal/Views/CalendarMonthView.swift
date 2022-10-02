import SwiftUI

struct CalendarMonthView: View {
  @ObservedObject var monthViewModel: CalendarMonthViewModel
  let dayViewModel: CalendarDayViewModel

  var body: some View {
    SpaceEvenlyGridView(
      columnCount: monthViewModel.columnCount
    ) { gridViewModel in
      LazyVGrid(columns: gridViewModel.columns, spacing: 4) {
        ForEach(monthViewModel.days, id: \.date) { day in
          SpaceEvenlyGridColumnView(gridViewModel: gridViewModel) {
            CalendarDayView(viewModel: dayViewModel, day: day)
          }
        }
      }
    }
  }
}
