import SwiftUI

struct ContentView: View {
  var body: some View {
    LayoutSettingsView {
      NavigationView {
        VStack(alignment: .leading) {
          CalendarView()
          Spacer()
        }
        .navigationTitle("Routine")
        .background(Color(.systemGroupedBackground))
      }
      .frame(height: UIScreen.main.bounds.height)
      .navigationViewStyle(.stack)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
