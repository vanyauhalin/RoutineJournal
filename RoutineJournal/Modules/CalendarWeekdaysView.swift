import SwiftUI

struct CalendarWeekdaysView<Content>: View where Content: View {
  let viewModel: CalendarWeekdaysViewModel
  @ViewBuilder var content: (CalendarWeekdayViewModel) -> Content

  var body: some View {
    HStack {
      ForEach(
        Array(viewModel.weekdays.enumerated()),
        id: \.offset
      ) { index, weekday in
        if index != .zero {
          Spacer()
        }
        content(weekday)
        if index != viewModel.weekdays.count - 1 {
          Spacer()
        }
      }
    }
    .padding([.horizontal])
  }
}
