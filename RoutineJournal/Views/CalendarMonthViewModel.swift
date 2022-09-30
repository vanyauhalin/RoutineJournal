import SwiftUI

class CalendarMonthViewModel: ObservableObject {
  let calendar: Calendar
  let month: CalendarMonth
  let columnCount: Int

  init(_ calendar: Calendar, month: CalendarMonth, columnCount: Int) {
    self.calendar = calendar
    self.month = month
    self.columnCount = columnCount
  }
}

extension CalendarMonthViewModel {
  private var previousDays: [CalendarDay] {
    if
      let firstWeekday = month.firstWeekday,
      let previousDays = month.previousMonth?.days
    {
      let dayCount = firstWeekday >= calendar.firstWeekday
      ? firstWeekday - calendar.firstWeekday
      : columnCount - (calendar.firstWeekday - firstWeekday)
      return Array(previousDays[(previousDays.count - dayCount)...])
    }
    return []
  }

  private var nextDays: [CalendarDay] {
    if
      let lastWeekday = month.lastWeekday,
      let nextDays = month.nextMonth?.days
    {
      let dayCount = lastWeekday >= calendar.firstWeekday
      ? columnCount - (lastWeekday - calendar.firstWeekday + 1)
      : calendar.firstWeekday - (lastWeekday + 1)
      return Array(nextDays[..<dayCount])
    }
    return []
  }

  var days: [CalendarDay] {
    previousDays + month.days + nextDays
  }
}
