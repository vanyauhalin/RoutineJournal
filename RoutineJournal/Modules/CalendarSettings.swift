import Foundation

// swiftlint:disable:next convenience_type
struct CalendarSettings {
  static let calendar = Calendar.current
  static let today = Date.now
  static let firstWeekday = CalendarSettings.calendar.firstWeekday
  static let weekdaySymbols = CalendarSettings.calendar.shortWeekdaySymbols
  static let weekdayCount = CalendarSettings.weekdaySymbols.count
}
