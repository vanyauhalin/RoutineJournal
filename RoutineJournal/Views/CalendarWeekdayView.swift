import SwiftUI

struct CalendarWeekdayView: View {
  var weekdaySymbol: String

  var body: some View {
    Text(weekdaySymbol)
      .font(.callout)
      .frame(width: 28, alignment: .center)
  }
}
