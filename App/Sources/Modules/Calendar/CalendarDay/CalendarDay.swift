import Foundation

class CalendarDay {
  private typealias Settings = CalendarSettings

  let date: Date
  var current: Bool {
    Settings.calendar
      .compare(date, to: Settings.today, toGranularity: .day)
      .rawValue == 0
  }

  init(date: Date) {
    self.date = date
  }
}
