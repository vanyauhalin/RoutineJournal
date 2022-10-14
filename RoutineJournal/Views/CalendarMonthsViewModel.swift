import SwiftUI

class CalendarMonthsViewModel: VStretchable {
  let calendar: Calendar
  @Published var monthViewModels: [CalendarMonthViewModel]
  @Published var monthViewModelSelection = Int.zero

  init(_ calendar: Calendar, monthViewModel: CalendarMonthViewModel) {
    self.calendar = calendar
    self.monthViewModels = [monthViewModel]
    super.init(
      height: CalendarDayView.width,
      count: monthViewModel.weekCount,
      selection: monthViewModel.weekIndex()
    )
    self.preloadMonthViews()
  }
}

extension CalendarMonthsViewModel {
  func preloadMonthViews() {
    loadPreviousMonthView()
    loadNextMonthView()
  }

  func loadPreviousMonthView() {
    if
      let selected = Optional(monthViewModels[monthViewModelSelection]),
      let previous = selected.month.previousMonth()
    {
      monthViewModels.insert(
        CalendarMonthViewModel(
          calendar,
          month: previous,
          columnCount: selected.columnCount
        ),
        at: .zero
      )
      monthViewModelSelection += 1
    }
  }

  func loadNextMonthView() {
    if
      let selected = Optional(monthViewModels[monthViewModelSelection]),
      let next = selected.month.nextMonth()
    {
      monthViewModels.append(
        CalendarMonthViewModel(
          calendar,
          month: next,
          columnCount: selected.columnCount
        )
      )
    }
  }

  func loadMonthView() {
    switch monthViewModelSelection {
      case Int.zero:
        loadPreviousMonthView()
      case monthViewModels.count - 1:
        loadNextMonthView()
      default:
        break
    }
  }
}
