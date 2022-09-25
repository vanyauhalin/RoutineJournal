import SwiftUI

struct CalendarDayView: View {
  var model: CalendarDayViewModel

  var body: some View {
    if model.current {
      Text(model.representation)
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.white)
        .frame(width: 28, height: 28, alignment: .center)
        .background {
          Circle()
            .foregroundColor(.black)
        }
    } else {
      Text(model.representation)
        .font(.callout)
        .frame(width: 28, height: 28, alignment: .center)
    }
  }
}

struct CalendarDayView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarDayView(model: CalendarDayViewModel(
      calendar: Calendar.current,
      today: Date.now,
      date: Date.now
    ))
  }
}
