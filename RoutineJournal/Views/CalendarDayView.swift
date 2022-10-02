import SwiftUI

struct CalendarDayView: View {
  let viewModel: CalendarDayViewModel

  var body: some View {
    if viewModel.day.current {
      Text(viewModel.represent)
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.white)
        .frame(width: 28, height: 28, alignment: .center)
        .background {
          Circle()
            .foregroundColor(.black)
        }
    } else {
      Text(viewModel.represent)
        .font(.callout)
        .frame(width: 28, height: 28, alignment: .center)
    }
  }
}
