import SwiftUI

class CalendarMonthsViewModel: ObservableObject {
  private typealias Settings = CalendarSettings

  var monthsContainer: VStretchable
  var monthContainer: VSpaceable

  @Published private(set) var months: [CalendarMonthViewModel]
  @Published var monthSelection: Int

  init() {
    let month = CalendarMonthViewModel(
      calendarMonth: .init(anchor: Settings.today)
    )
    let months = [month]

    self.monthsContainer = .init(
      rowHeight: CalendarDayView.width,
      rowCount: month.weekCount,
      rowSelection: month.weekIndex() ?? .zero
    )
    self.monthContainer = .init(
      columnWidth: CalendarDayView.width,
      columnCount: Settings.weekdaySymbols.count
    )
    self.months = months
    self.monthSelection = months.startIndex

    loadPreviousMonth()
    loadNextMonth()
  }

  private func loadPreviousMonth() {
    guard
      let selected = Optional(months[monthSelection]),
      let previous = selected.calendarMonth.previousCalendarMonth()
    else {
      return
    }
    months.insert(.init(calendarMonth: previous), at: .zero)
    monthSelection += 1
  }

  private func loadNextMonth() {
    guard
      let selected = Optional(months[monthSelection]),
      let next = selected.calendarMonth.nextCalendarMonth()
    else {
      return
    }
    months.append(.init(calendarMonth: next))
  }

  func loadMonth() {
    switch monthSelection {
      case .zero:
        loadPreviousMonth()
      case months.count - 1:
        loadNextMonth()
      default:
        break
    }
  }
}
