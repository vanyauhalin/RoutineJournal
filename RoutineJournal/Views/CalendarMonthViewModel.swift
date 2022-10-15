import SwiftUI

class CalendarMonthViewModel: ObservableObject {
  private typealias Settings = CalendarSettings

  let month: CalendarMonth
  let columns: [GridItem]

  init(month: CalendarMonth, columns: [GridItem]) {
    self.month = month
    self.columns = columns
  }
}

extension CalendarMonthViewModel {
  private var previousDays: [CalendarDay] {
    if
      let firstWeekday = month.firstWeekday,
      let previousDays = month.previousMonth()?.days
    {
      let dayCount = firstWeekday >= Settings.firstWeekday
      ? firstWeekday - Settings.firstWeekday
      : columns.count - (Settings.firstWeekday - firstWeekday)
      return Array(previousDays[(previousDays.count - dayCount)...])
    }
    return []
  }

  private var nextDays: [CalendarDay] {
    if
      let lastWeekday = month.lastWeekday,
      let nextDays = month.nextMonth()?.days
    {
      let dayCount = lastWeekday >= Settings.firstWeekday
      ? columns.count - (lastWeekday - Settings.firstWeekday + 1)
      : Settings.firstWeekday - (lastWeekday + 1)
      return Array(nextDays[..<dayCount])
    }
    return []
  }

  var dayViewModels: [CalendarDayViewModel] {
    return Array(previousDays + month.days + nextDays).map { day in
      CalendarDayViewModel(day: day)
    }
  }
}

extension CalendarMonthViewModel {
  var weekCount: Int {
    dayViewModels.count / columns.count
  }

  func weekIndex() -> Int {
    if
      let index = dayViewModels.firstIndex(where: { dayViewModel in
        dayViewModel.day.current
      })
    {
      return Int(Float((index + 1) / columns.count).rounded(.up))
    }
    return 0
  }
}
