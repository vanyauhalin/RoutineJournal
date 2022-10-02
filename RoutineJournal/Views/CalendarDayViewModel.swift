import Foundation

class CalendarDayViewModel {
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
  }()
  let day: CalendarDay

  init(day: CalendarDay) {
    self.day = day
  }
}

extension CalendarDayViewModel {
  var represent: String {
    let formatted = CalendarDayViewModel.formatter.string(from: day.date)
    if let firstCharacter = formatted.first, firstCharacter == "0" {
      return formatted.last?.description ?? formatted
    }
    return formatted
  }
}
