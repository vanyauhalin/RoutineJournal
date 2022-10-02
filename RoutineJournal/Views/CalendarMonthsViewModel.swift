import Foundation

class CalendarMonthsViewModel: ObservableObject {
  let calendar: Calendar
  @Published var monthViewModels: [CalendarMonthViewModel]
  @Published var selection = Int.zero

  init(_ calendar: Calendar, monthViewModel: CalendarMonthViewModel) {
    self.calendar = calendar
    self.monthViewModels = [monthViewModel]
    self.initMonths()
  }
}

extension CalendarMonthsViewModel {
  func initMonths() {
    loadPreviousMonth()
//    loadPreviousMonth()
    loadNextMonth()
//    loadNextMonth()
  }

  func loadPreviousMonth() {
    if
      let selected = Optional(monthViewModels[selection]),
      let previousMonth = selected.month.previousMonth()
    {
      monthViewModels.insert(
        CalendarMonthViewModel(
          calendar,
          month: previousMonth,
          columnCount: selected.columnCount
        ),
        at: .zero
      )
      selection += 1
    }
  }

  func loadNextMonth() {
    if
      let selected = Optional(monthViewModels[selection]),
      let nextMonth = selected.month.nextMonth()
    {
      monthViewModels.append(
        CalendarMonthViewModel(
          calendar,
          month: nextMonth,
          columnCount: selected.columnCount
        )
      )
    }
  }

  func loadMonths() {
    switch selection {
      case Int.zero:
        loadPreviousMonth()
//        loadPreviousMonth()
      case monthViewModels.count - 1:
        loadNextMonth()
//        loadNextMonth()
      default:
        break
    }
  }
}
