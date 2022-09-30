import SwiftUI

struct CalendarWeekdaysView: View {
  let weekdaySymbols: [String]

  var body: some View {
    HStack {
      Spacer()
      ForEach(weekdaySymbols, id: \.self) { weekdaySymbol in
        Spacer()
        CalendarWeekdayView(weekdaySymbol: weekdaySymbol)
        Spacer()
      }
      Spacer()
    }
  }
}

struct CalendarWeekdaysView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarWeekdaysView(
      weekdaySymbols: Calendar.current.veryShortWeekdaySymbols
    )
  }
}
