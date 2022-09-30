import SwiftUI

struct ContentView: View {
  let calendar = Calendar.current
  var calendarViewModel: CalendarViewModel {
    CalendarViewModel(calendar)
  }
  var monthViewModel: CalendarMonthViewModel {
    CalendarMonthViewModel(
      calendar,
      month: CalendarMonth(calendar, anchor: Date.now),
      columnCount: calendarViewModel.weekdaySymbols.count
    )
  }
  let dayViewModel = CalendarDayViewModel()

  var body: some View {
    VStack {
      CalendarView(
        calendarViewModel: calendarViewModel,
        monthViewModel: monthViewModel,
        dayViewModel: dayViewModel
      )
    }
    .frame(height: UIScreen.main.bounds.height)
    .background(Color(.systemGroupedBackground))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
