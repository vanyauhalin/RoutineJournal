import Foundation

class CalendarDay {
  let current: Bool
  let date: Date

  init(_ calendar: Calendar, date: Date) {
    self.current = calendar
      .compare(date, to: Date.now, toGranularity: .day)
      .rawValue == 0
    self.date = date
  }
}
