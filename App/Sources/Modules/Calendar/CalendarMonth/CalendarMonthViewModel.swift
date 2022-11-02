import SwiftUI

class CalendarMonthViewModel: ObservableObject {
  private typealias Settings = CalendarSettings
  let calendarMonth: CalendarMonth

  init(calendarMonth: CalendarMonth) {
    self.calendarMonth = calendarMonth
  }
}

extension CalendarMonthViewModel {
  private var previousCalendarDays: [CalendarDay] {
    guard
      let firstWeekday = calendarMonth.firstWeekday,
      let calendarDays = calendarMonth.previousCalendarMonth()?.calendarDays
    else {
      return []
    }

    let dayCount = firstWeekday >= Settings.firstWeekday
    ? firstWeekday - Settings.firstWeekday
    : Settings.weekdayCount - (Settings.firstWeekday - firstWeekday)
    return Array(calendarDays[(calendarDays.count - dayCount)...])
  }

  private var nextCalendarDays: [CalendarDay] {
    guard
      let lastWeekday = calendarMonth.lastWeekday,
      let calendarDays = calendarMonth.nextCalendarMonth()?.calendarDays
    else {
      return []
    }

    let dayCount = lastWeekday >= Settings.firstWeekday
    ? Settings.weekdayCount - (lastWeekday - Settings.firstWeekday + 1)
    : Settings.firstWeekday - (lastWeekday + 1)
    return Array(calendarDays[..<dayCount])
  }

  var days: [CalendarDayViewModel] {
    Array(
      previousCalendarDays
      + calendarMonth.calendarDays
      + nextCalendarDays
    ).map { calendarDay in
      .init(calendarDay: calendarDay)
    }
  }
}

extension CalendarMonthViewModel {
  var weekCount: Int {
    days.count / Settings.weekdayCount
  }

  func weekIndex() -> Int? {
    guard
      let index = days.firstIndex(where: { day in
        day.calendarDay.current
      })
    else {
      return nil
    }

    let rounded = (Float(index + 1) / Float(Settings.weekdayCount)).rounded(.up)
    return Int(rounded) - 1
  }
}
