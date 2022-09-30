import Foundation

struct CalendarViewModel {
  let calendar: Calendar
  var weekdaySymbols: [String] {
    let defaultSymbols = calendar.veryShortWeekdaySymbols
    if calendar.firstWeekday == 1 {
      return defaultSymbols
    }
    let bound = calendar.firstWeekday - 1
    return Array(defaultSymbols[bound...] + defaultSymbols[..<bound])
  }

  init(_ calendar: Calendar) {
    self.calendar = calendar
  }
}
