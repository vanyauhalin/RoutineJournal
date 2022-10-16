import SwiftUI

struct CalendarMonthsView<Content>: View where Content: View {
  @ObservedObject var viewModel: CalendarMonthsViewModel
  @ViewBuilder let content: (CalendarMonthViewModel, [GridItem]) -> Content

  var body: some View {
    CalendarMonthsCoordinateReaderView(viewModel: viewModel) {
      VStretchableContainerView(viewModel: viewModel.monthsContainer) {
        TabView(selection: $viewModel.monthSelection) {
          ForEach(
            Array(viewModel.months.enumerated()),
            id: \.offset
          ) { index, month in
            // TODO: solve the columns spacing problem and remove ZStack.
            ZStack {
              VStretchableContentView(viewModel: viewModel.monthsContainer) {
                content(month, viewModel.monthContainer.columns)
                  .tag(index)
                  .padding([.horizontal])
                  .onDisappear {
                    viewModel.loadMonth()
                  }
              }
            }
          }
        }
        .id(viewModel.months.count)
        .tabViewStyle(.page(indexDisplayMode: .never))
      }
    }
  }
}

extension CalendarMonthsView {
  struct CalendarMonthsCoordinateReaderView<Content>: View where Content: View {
    @ObservedObject var viewModel: CalendarMonthsViewModel
    @ViewBuilder let content: () -> Content

    var body: some View {
      ZStack {
        ZStack {
          VSpaceableContainerView(viewModel: viewModel.monthContainer) {
            Color.clear
          }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 0)
        .hidden()
        content()
      }
    }
  }
}
