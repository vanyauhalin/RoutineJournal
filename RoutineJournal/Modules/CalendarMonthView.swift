import SwiftUI

struct CalendarMonthView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthViewModel
  let columns: [GridItem]
  @ViewBuilder var content: (CalendarDayViewModel) -> Content

  var body: some View {
    LazyVGrid(columns: columns, spacing: .zero) {
      ForEach(viewModel.days, id: \.calendarDay.date) { day in
        content(day)
      }
    }
  }
}
