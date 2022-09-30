import Foundation

class CalendarDayViewModel {
  private let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
  }()

  func represent(date: Date) -> String {
    let formatted = formatter.string(from: date)
    if let firstCharacter = formatted.first, firstCharacter == "0" {
      return formatted.last?.description ?? formatted
    }
    return formatted
  }
}
