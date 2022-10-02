import Foundation

class CalendarViewModel {
  let calendar: Calendar
  let today: Date

  init(_ calendar: Calendar, today: Date) {
    self.calendar = calendar
    self.today = today
  }
}

extension CalendarViewModel {
  var weekdaySymbols: [String] {
    let defaultSymbols = calendar.veryShortWeekdaySymbols
    if calendar.firstWeekday == 1 {
      return defaultSymbols
    }
    let bound = calendar.firstWeekday - 1
    return Array(defaultSymbols[bound...] + defaultSymbols[..<bound])
  }
}

extension CalendarViewModel {
  var month: CalendarMonth {
    CalendarMonth(calendar, anchor: today)
  }

  var monthViewModel: CalendarMonthViewModel {
    CalendarMonthViewModel(
      calendar,
      month: month,
      columnCount: weekdaySymbols.count
    )
  }

  var monthsViewModel: CalendarMonthsViewModel {
    CalendarMonthsViewModel(calendar, monthViewModel: monthViewModel)
  }
}
