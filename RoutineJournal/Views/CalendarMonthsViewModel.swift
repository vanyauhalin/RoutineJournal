import SwiftUI

class CalendarMonthsViewModel: ObservableObject {
  private let calendar: Calendar
  let anchor: Date

  let month: Month
  var container: VStretchable?

  @Published var list: [CalendarMonthViewModel] = []
  @Published var monthSelection = Int.zero

  init(_ calendar: Calendar, anchor: Date, count: Int) {
    self.calendar = calendar
    self.anchor = anchor
    self.month = Month(columnWidth: CalendarDayView.width, columnCount: count)
    self.month.willSetSelection { monthSelection in
      self.monthSelection = monthSelection
    }
  }
}

extension CalendarMonthsViewModel {
  private func loadPrevious() {
    if
      let selected = Optional(list[month.selection]),
      let previous = selected.month.previousMonth()
    {
      list.insert(
        CalendarMonthViewModel(
          calendar,
          month: previous,
          columns: month.columns
        ),
        at: .zero
      )
      month.selection += 1
    }
  }

  private func loadNext() {
    if
      let selected = Optional(list[month.selection]),
      let next = selected.month.nextMonth()
    {
      list.append(
        CalendarMonthViewModel(
          calendar,
          month: next,
          columns: month.columns
        )
      )
    }
  }

  func preload() {
    let month = CalendarMonthViewModel(
      calendar,
      month: CalendarMonth(calendar, anchor: anchor),
      columns: self.month.columns
    )
    list = [month]
    container = VStretchable(
      height: CalendarDayView.width,
      count: month.weekCount,
      selection: month.weekIndex()
    )

    loadPrevious()
    loadNext()
  }

  func load() {
    switch month.selection {
      case Int.zero:
        loadPrevious()
      case list.count - 1:
        loadNext()
      default:
        break
    }
  }
}

extension CalendarMonthsViewModel {
  class Month: VSpaceable {
    private var willSetSelectionCallback: ((Int) -> Void)?
    var selection = Int.zero {
      willSet {
        if let callback = willSetSelectionCallback {
          callback(newValue)
        }
      }
    }

    func willSetSelection(_ callback: @escaping (Int) -> Void) {
      self.willSetSelectionCallback = callback
    }
  }
}
