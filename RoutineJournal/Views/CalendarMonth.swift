import Foundation

class CalendarMonth {
  private let anchor: Date
  let calendar: Calendar

  init(_ calendar: Calendar, anchor: Date) {
    self.calendar = calendar
    self.anchor = anchor
  }
}

extension CalendarMonth {
  var firstDay: Date? {
    return calendar.date(
      from: calendar.dateComponents(
        [.year, .month],
        from: calendar.startOfDay(for: anchor)
      )
    )
  }

  var lastDay: Date? {
    if let unwrappedFirstDay = firstDay {
      return calendar.date(
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
      return calendar
        .dateComponents(
          [.weekday],
          from: calendar.startOfDay(for: unwrappedFirstDay)
        )
        .weekday
    }
    return nil
  }

  var lastWeekday: Int? {
    if let unwrappedLastDay = lastDay {
      return calendar
        .dateComponents(
          [.weekday],
          from: calendar.startOfDay(for: unwrappedLastDay)
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
      let previousMonthAnchor = calendar.date(
        byAdding: .month,
        value: -1,
        to: unwrappedFirstDay
      )
    {
      return CalendarMonth(calendar, anchor: previousMonthAnchor)
    }
    return nil
  }

  func nextMonth() -> CalendarMonth? {
    if
      let unwrappedFirstDay = firstDay,
      let nextMonthAnchor = calendar.date(
        byAdding: .month,
        value: 1,
        to: unwrappedFirstDay
      )
    {
      return CalendarMonth(calendar, anchor: nextMonthAnchor)
    }
    return nil
  }
}

extension CalendarMonth {
  var days: [CalendarDay] {
    if
      let unwrappedFirstDay = firstDay,
      let firstDayNumber = calendar
        .dateComponents([.day], from: unwrappedFirstDay)
        .day,
      let unwrappedLastDay = lastDay,
      let lastDayNumber = calendar
        .dateComponents([.day], from: unwrappedLastDay)
        .day
    {
      return ((firstDayNumber - 1)..<lastDayNumber).compactMap { number in
        if let day = calendar.date(
          byAdding: .day,
          value: number,
          to: unwrappedFirstDay
        ) {
          return CalendarDay(calendar, date: day)
        }
        return nil
      }
    }
    return []
  }
}
