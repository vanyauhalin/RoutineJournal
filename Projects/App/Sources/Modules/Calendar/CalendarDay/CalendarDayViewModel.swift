import Foundation

class CalendarDayViewModel {
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
  }()

  let calendarDay: CalendarDay
  var represent: String {
    let formatted = CalendarDayViewModel
      .formatter
      .string(from: calendarDay.date)
    if let firstCharacter = formatted.first, firstCharacter == "0" {
      return formatted.last?.description ?? formatted
    }
    return formatted
  }

  init(calendarDay: CalendarDay) {
    self.calendarDay = calendarDay
  }
}
