import Foundation

class CalendarViewModel {
  private let calendar = Calendar.current
  private let today = Date.now
  private var firstWeekday: Date {
    return calendar.date(from: calendar.dateComponents(
      [.yearForWeekOfYear, .weekOfYear],
      from: today
    )) ?? today
  }
  var weekdays: [CalendarDayViewModel] {
    return (0..<weekdaySymbols.count)
      .compactMap { index in
        if let day = calendar.date(
          byAdding: .day,
          value: index,
          to: firstWeekday
        ) {
          return CalendarDayViewModel(
            calendar: calendar,
            today: today,
            date: day
          )
        }
        return nil
      }
  }
  var weekdaySymbols: [String] {
    return calendar.veryShortWeekdaySymbols
  }
}
