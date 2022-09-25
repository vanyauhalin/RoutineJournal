import Foundation

class CalendarDayViewModel {
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
  }()

  let current: Bool
  let date: Date
  var representation: String {
    CalendarDayViewModel.formatter.string(from: date)
  }

  init(calendar: Calendar, today: Date, date: Date) {
    self.current = calendar
      .compare(date, to: today, toGranularity: .day)
      .rawValue == 0
    self.date = date
  }
}
