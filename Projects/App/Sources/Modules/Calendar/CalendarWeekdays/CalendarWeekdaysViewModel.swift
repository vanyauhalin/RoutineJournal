import Foundation

class CalendarWeekdaysViewModel {
  private typealias Settings = CalendarSettings

  private var weekdaySymbols: [String] {
    if Settings.firstWeekday == 1 {
      return Settings.weekdaySymbols
    }
    let bound = Settings.firstWeekday - 1
    return Array(
      Settings.weekdaySymbols[bound...]
      + Settings.weekdaySymbols[..<bound]
    )
  }
  var weekdays: [CalendarWeekdayViewModel] {
    weekdaySymbols.map { weekdaySymbol in
      .init(weekdaySymbol: weekdaySymbol)
    }
  }
}
