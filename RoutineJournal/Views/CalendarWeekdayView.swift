import SwiftUI

struct CalendarWeekdayView: View {
  var weekdaySymbol: String

  var body: some View {
    Text(weekdaySymbol)
      .font(.callout)
      .frame(width: 28, alignment: .center)
  }
}

struct CalendarWeekdayView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarWeekdayView(weekdaySymbol: "S")
  }
}
