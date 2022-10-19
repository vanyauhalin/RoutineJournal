import SwiftUI

struct CalendarDayView: View {
  static let width = CGFloat(28)
  let viewModel: CalendarDayViewModel

  var body: some View {
    if viewModel.calendarDay.current {
      Text(viewModel.represent)
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.white)
        .frame(
          width: CalendarDayView.width,
          height: CalendarDayView.width,
          alignment: .center
        )
        .background {
          Circle()
            .foregroundColor(.black)
        }
    } else {
      Text(viewModel.represent)
        .font(.callout)
        .frame(
          width: CalendarDayView.width,
          height: CalendarDayView.width,
          alignment: .center
        )
    }
  }
}
