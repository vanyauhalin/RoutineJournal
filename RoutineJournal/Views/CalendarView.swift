import SwiftUI

struct CalendarView: View {
  let viewModel: CalendarViewModel
  @ObservedObject private var evenlyViewModel: SpaceEvenlyViewModel

  var body: some View {
    VStack(spacing: 4) {
      CalendarWeekdaysView(
        weekdaySymbols: viewModel.weekdaySymbols
      ) { weekdaySymbol in
        CalendarWeekdayView(weekdaySymbol: weekdaySymbol)
      }
      CalendarMonthsView(
        viewModel: viewModel.monthsViewModel,
        evenlyViewModel: evenlyViewModel
      ) { monthViewModel in
        CalendarMonthView(
          viewModel: monthViewModel,
          evenlyViewModel: evenlyViewModel
        ) { dayViewModel in
          CalendarDayView(viewModel: dayViewModel)
        }
      }
    }
  }

  init(viewModel: CalendarViewModel) {
    self.viewModel = viewModel
    self.evenlyViewModel = SpaceEvenlyViewModel(
      columnCount: viewModel.weekdaySymbols.count,
      columnWidth: CalendarDayView.width
    )
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = CalendarViewModel(Calendar.current, today: Date.now)
    CalendarView(viewModel: viewModel)
  }
}
