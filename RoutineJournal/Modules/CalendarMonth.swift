import Foundation

class CalendarMonth {
  private typealias Settings = CalendarSettings
  private let anchor: Date

  init(anchor: Date) {
    self.anchor = anchor
  }
}

extension CalendarMonth {
  private var firstDay: Date? {
    Settings.calendar.date(
      from: Settings.calendar.dateComponents(
        [.year, .month],
        from: Settings.calendar.startOfDay(for: anchor)
      )
    )
  }

  private var lastDay: Date? {
    guard let firstDay = firstDay else { return nil }
    return Settings.calendar.date(
      byAdding: DateComponents(month: 1, day: -1),
      to: firstDay
    )
  }

  var firstWeekday: Int? {
    guard let firstDay = firstDay else { return nil }
    return Settings.calendar
      .dateComponents(
        [.weekday],
        from: Settings.calendar.startOfDay(for: firstDay)
      )
      .weekday
  }

  var lastWeekday: Int? {
    guard let lastDay = lastDay else { return nil }
    return Settings.calendar
      .dateComponents(
        [.weekday],
        from: Settings.calendar.startOfDay(for: lastDay)
      )
      .weekday
  }

  private var days: [Date] {
    guard
      let firstDay = firstDay,
      let firstDayNumber = Settings.calendar
        .dateComponents([.day], from: firstDay)
        .day,
      let lastDay = lastDay,
      let lastDayNumber = Settings.calendar
        .dateComponents([.day], from: lastDay)
        .day
    else {
      return []
    }
    return ((firstDayNumber - 1)..<lastDayNumber).compactMap { number in
      Settings.calendar.date(
        byAdding: .day,
        value: number,
        to: firstDay
      )
    }
  }
}

extension CalendarMonth {
  var calendarDays: [CalendarDay] {
    days.map { day in
      .init(date: day)
    }
  }

  func previousCalendarMonth() -> CalendarMonth? {
    guard
      let firstDay = firstDay,
      let previousMonthAnchor = Settings.calendar.date(
        byAdding: .month,
        value: -1,
        to: firstDay
      )
    else {
      return nil
    }
    return CalendarMonth(anchor: previousMonthAnchor)
  }

  func nextCalendarMonth() -> CalendarMonth? {
    guard
      let firstDay = firstDay,
      let nextMonthAnchor = Settings.calendar.date(
        byAdding: .month,
        value: 1,
        to: firstDay
      )
    else {
      return nil
    }
    return CalendarMonth(anchor: nextMonthAnchor)
  }
}
