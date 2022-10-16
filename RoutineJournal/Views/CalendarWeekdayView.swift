import SwiftUI

struct CalendarWeekdayView: View {
  let viewModel: CalendarWeekdayViewModel

  var body: some View {
    Text(viewModel.weekdaySymbol)
      .font(.caption)
      .frame(width: 28, alignment: .center)
  }
}
