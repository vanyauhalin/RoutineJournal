import SwiftUI

struct CalendarMonthView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthViewModel
  @ViewBuilder var content: (CalendarDayViewModel) -> Content

  var body: some View {
    LazyVGrid(columns: viewModel.columns, spacing: .zero) {
      ForEach(viewModel.dayViewModels, id: \.day.date) { dayViewModel in
        content(dayViewModel)
      }
    }
  }
}
