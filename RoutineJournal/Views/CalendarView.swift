import SwiftUI

struct CalendarView: View {
  let viewModel: CalendarViewModel

  var body: some View {
    VStack(spacing: 4) {
      CalendarWeekdaysView(
        weekdaySymbols: viewModel.weekdaySymbols
      ) { weekdaySymbol in
        CalendarWeekdayView(weekdaySymbol: weekdaySymbol)
      }
      CalendarMonthsView(months: viewModel.monthsViewModel) { monthViewModel in
        CalendarMonthView(viewModel: monthViewModel) { dayViewModel in
          CalendarDayView(viewModel: dayViewModel)
        }
      }
    }
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = CalendarViewModel(Calendar.current, today: Date.now)
    CalendarView(viewModel: viewModel)
  }
}
