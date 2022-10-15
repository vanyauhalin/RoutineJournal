import SwiftUI

struct CalendarMonthsView<Content>: View where Content: View {
  @ObservedObject var months: CalendarMonthsViewModel
  @ViewBuilder let content: (CalendarMonthViewModel) -> Content

  var body: some View {
    CalendarMonthsContainerView(viewModel: months) { container in
      VStretchableContainerView(viewModel: container) {
        TabView(selection: $months.monthSelection) {
          ForEach(
            Array(months.list.enumerated()),
            id: \.offset
          ) { index, monthViewModel in
            VStretchableContentView(viewModel: container) {
              content(monthViewModel)
                .tag(index)
                .padding([.horizontal])
                .onDisappear {
                  months.load()
                }
            }
          }
        }
        .id(months.list.count)
        .tabViewStyle(.page(indexDisplayMode: .never))
      }
    }
  }
}
