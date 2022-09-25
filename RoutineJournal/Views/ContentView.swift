import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      CalendarView(model: CalendarViewModel())
    }
    .frame(width: .infinity, height: UIScreen.main.bounds.height)
    .background(Color(.systemGroupedBackground))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
