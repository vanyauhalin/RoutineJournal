import SwiftUI

class CalendarMonthsViewModel: ObservableObject {
  private typealias Settings = CalendarSettings

  var monthsContainer: VStretchable
  var monthContainer: VSpaceable

  private var previousMonthSelection = -1
  @Published var monthSelection = Int.zero {
    willSet {
      previousMonthSelection = monthSelection
    }
  }

  @Published private(set) var months: [CalendarMonthViewModel]

  init() {
    let month = CalendarMonthViewModel(
      calendarMonth: .init(anchor: Settings.today)
    )
    self.monthsContainer = .init(
      rowHeight: CalendarDayView.width,
      rowCount: month.weekCount,
      rowSelection: month.weekIndex() ?? .zero
    )
    self.monthContainer = .init(
      containerWidth: CalendarMonthsContainerView.width,
      columnWidth: CalendarDayView.width,
      columnCount: Settings.weekdaySymbols.count
    )
    self.months = [month]

    loadPreviousMonth()
    loadNextMonth()
  }
}

extension CalendarMonthsViewModel {
  private enum Direction {
    case previous
    case next
  }
  private var direction: Direction {
    monthSelection > previousMonthSelection ? .next : .previous
  }
}

extension CalendarMonthsViewModel {
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
    switch direction {
      case .previous:
        guard monthSelection == .zero else { return }
        loadPreviousMonth()
      case .next:
        guard monthSelection == months.count - 1 else { return }
        loadNextMonth()
    }
  }
}

extension CalendarMonthsViewModel {
  func updateHeight() {
    guard let selected = Optional(months[monthSelection]) else { return }
    monthsContainer.set(rowCount: selected.weekCount)
  }
}
