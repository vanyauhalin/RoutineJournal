import SwiftUI

struct CalendarView: View {
  private let viewModel = CalendarViewModel()

  var body: some View {
    VStack(spacing: 4) {
      CalendarWeekdaysView(viewModel: viewModel.weekdays) { weekday in
        CalendarWeekdayView(viewModel: weekday)
      }
      CalendarMonthsView(viewModel: viewModel.months) { month, columns in
        CalendarMonthView(viewModel: month, columns: columns) { day in
          CalendarDayView(viewModel: day)
        }
      }
    }
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarView()
  }
}
