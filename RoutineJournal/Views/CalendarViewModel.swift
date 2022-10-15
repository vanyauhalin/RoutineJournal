import Foundation

class CalendarViewModel {
  private typealias Settings = CalendarSettings

  init(_ calendar: Calendar, today: Date) {
    //
  }
}

extension CalendarViewModel {
  var weekdaySymbols: [String] {
    if Settings.firstWeekday == 1 {
      return Settings.weekdaySymbols
    }
    let bound = Settings.firstWeekday - 1
    return Array(
      Settings.weekdaySymbols[bound...]
      + Settings.weekdaySymbols[..<bound]
    )
  }
}

extension CalendarViewModel {
  var monthsViewModel: CalendarMonthsViewModel {
    CalendarMonthsViewModel()
  }
}
