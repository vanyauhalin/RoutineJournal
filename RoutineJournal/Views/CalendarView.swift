import SwiftUI

struct CalendarView: View {
  @ObservedObject private var gridViewModel: SpaceEvenlyGridViewModel
  let viewModel: CalendarViewModel

  var body: some View {
    VStack(spacing: 4) {
      CalendarWeekdaysView(
        weekdaySymbols: viewModel.weekdaySymbols
      ) { weekdaySymbol in
        CalendarWeekdayView(weekdaySymbol: weekdaySymbol)
      }
      CalendarMonthsView(
        viewModel: viewModel.monthsViewModel
      ) { monthViewModel in
        CalendarMonthView(
          monthViewModel: monthViewModel,
          gridViewModel: gridViewModel
        ) { dayViewModel in
          CalendarDayView(viewModel: dayViewModel)
        }
      }
    }
  }

  init(viewModel: CalendarViewModel) {
    self.viewModel = viewModel
    self.gridViewModel = SpaceEvenlyGridViewModel(
      columnCount: viewModel.weekdaySymbols.count
    )
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = CalendarViewModel(Calendar.current, today: Date.now)
    CalendarView(viewModel: viewModel)
  }
}
