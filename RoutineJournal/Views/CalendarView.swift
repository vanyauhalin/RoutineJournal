import SwiftUI

struct CalendarView: View {
  var model: CalendarViewModel

  var body: some View {
    VStack(spacing: 4) {
      HStack {
        Spacer()
        ForEach(model.weekdaySymbols, id: \.self) { symbol in
          Spacer()
          CalendarWeekdayView(weekdaySymbol: symbol)
          Spacer()
        }
        Spacer()
      }
      HStack {
        Spacer()
        ForEach(model.weekdays, id: \.date) { day in
          Spacer()
          CalendarDayView(model: day)
          Spacer()
        }
        Spacer()
      }
    }
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarView(model: CalendarViewModel())
  }
}
