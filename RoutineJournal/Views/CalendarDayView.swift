import SwiftUI

struct CalendarDayView: View {
  let viewModel: CalendarDayViewModel
  var day: CalendarDay

  var body: some View {
    if day.current {
      Text(viewModel.represent(date: day.date))
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.white)
        .frame(width: 28, height: 28, alignment: .center)
        .background {
          Circle()
            .foregroundColor(.black)
        }
    } else {
      Text(viewModel.represent(date: day.date))
        .font(.callout)
        .frame(width: 28, height: 28, alignment: .center)
    }
  }
}
