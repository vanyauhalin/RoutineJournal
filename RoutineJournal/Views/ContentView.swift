import SwiftUI

struct ContentView: View {
  var calendarViewModel = CalendarViewModel()

  var body: some View {
    VStack {
      CalendarView(viewModel: calendarViewModel)
    }
    .frame(height: UIScreen.main.bounds.height)
    .background(Color(.systemGroupedBackground))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
