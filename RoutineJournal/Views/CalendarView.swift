import SwiftUI

struct CalendarView: View {
  let calendarViewModel: CalendarViewModel
  let monthViewModel: CalendarMonthViewModel
  let dayViewModel: CalendarDayViewModel

  var body: some View {
    VStack(spacing: 4) {
      HStack {
        Spacer()
        ForEach(calendarViewModel.weekdaySymbols, id: \.self) { weekdaySymbol in
          Spacer()
          CalendarWeekdayView(weekdaySymbol: weekdaySymbol)
          Spacer()
        }
        Spacer()
      }
      CalendarMonthView(
        monthViewModel: monthViewModel,
        dayViewModel: dayViewModel
      )
    }
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    let calendar = Calendar.current
    let calendarViewModel = CalendarViewModel(calendar)
    CalendarView(
      calendarViewModel: calendarViewModel,
      monthViewModel: CalendarMonthViewModel(
        calendar,
        month: CalendarMonth(calendar, anchor: Date.now),
        columnCount: calendarViewModel.weekdaySymbols.count
      ),
      dayViewModel: CalendarDayViewModel()
    )
  }
}
