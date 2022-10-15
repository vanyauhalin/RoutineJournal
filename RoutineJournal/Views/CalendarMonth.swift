import Foundation

class CalendarMonth {
  private typealias Settings = CalendarSettings
  private let anchor: Date

  init(anchor: Date) {
    self.anchor = anchor
  }
}

extension CalendarMonth {
  var firstDay: Date? {
    return Settings.calendar.date(
      from: Settings.calendar.dateComponents(
        [.year, .month],
        from: Settings.calendar.startOfDay(for: anchor)
      )
    )
  }

  var lastDay: Date? {
    if let unwrappedFirstDay = firstDay {
      return Settings.calendar.date(
        byAdding: DateComponents(month: 1, day: -1),
        to: unwrappedFirstDay
      )
    }
    return nil
  }
}

extension CalendarMonth {
  var firstWeekday: Int? {
    if let unwrappedFirstDay = firstDay {
      return Settings.calendar
        .dateComponents(
          [.weekday],
          from: Settings.calendar.startOfDay(for: unwrappedFirstDay)
        )
        .weekday
    }
    return nil
  }

  var lastWeekday: Int? {
    if let unwrappedLastDay = lastDay {
      return Settings.calendar
        .dateComponents(
          [.weekday],
          from: Settings.calendar.startOfDay(for: unwrappedLastDay)
        )
        .weekday
    }
    return nil
  }
}

extension CalendarMonth {
  func previousMonth() -> CalendarMonth? {
    if
      let unwrappedFirstDay = firstDay,
      let previousMonthAnchor = Settings.calendar.date(
        byAdding: .month,
        value: -1,
        to: unwrappedFirstDay
      )
    {
      return CalendarMonth(anchor: previousMonthAnchor)
    }
    return nil
  }

  func nextMonth() -> CalendarMonth? {
    if
      let unwrappedFirstDay = firstDay,
      let nextMonthAnchor = Settings.calendar.date(
        byAdding: .month,
        value: 1,
        to: unwrappedFirstDay
      )
    {
      return CalendarMonth(anchor: nextMonthAnchor)
    }
    return nil
  }
}

extension CalendarMonth {
  var days: [CalendarDay] {
    if
      let unwrappedFirstDay = firstDay,
      let firstDayNumber = Settings.calendar
        .dateComponents([.day], from: unwrappedFirstDay)
        .day,
      let unwrappedLastDay = lastDay,
      let lastDayNumber = Settings.calendar
        .dateComponents([.day], from: unwrappedLastDay)
        .day
    {
      return ((firstDayNumber - 1)..<lastDayNumber).compactMap { number in
        if let day = Settings.calendar.date(
          byAdding: .day,
          value: number,
          to: unwrappedFirstDay
        ) {
          return CalendarDay(Settings.calendar, date: day)
        }
        return nil
      }
    }
    return []
  }
}
