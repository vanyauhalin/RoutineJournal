import SwiftUI

class CalendarMonthsViewModel: ObservableObject {
  private typealias Settings = CalendarSettings

  let month: Month
  var container: VStretchable?

  @Published var list: [CalendarMonthViewModel] = []
  @Published var monthSelection = Int.zero

  init() {
    self.month = Month(
      columnWidth: CalendarDayView.width,
      columnCount: Settings.weekdaySymbols.count
    )
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
        CalendarMonthViewModel(month: previous, columns: month.columns),
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
        CalendarMonthViewModel(month: next, columns: month.columns)
      )
    }
  }

  func preload() {
    let month = CalendarMonthViewModel(
      month: CalendarMonth(anchor: Settings.today),
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
