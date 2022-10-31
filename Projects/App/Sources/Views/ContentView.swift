import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      ContentViewToolbar {
        VStack(spacing: 8) {
          JournalEventView(
            journalEvent: JournalEvent(
              title: "Flight from London to Paris",
              description: "Almost missed my flight",
              systemImage: "airplane",
              startDate: "9:00",
              endDate: "10:00",
              theme: .indigo
            )
          )
          Spacer()
        }
        .navigationTitle("Routine")
        .padding([.horizontal])
      }
    }
  }
}

struct ContentViewToolbar<Content>: View where Content: View {
  var toolbarDate: String = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d"
    return formatter.string(from: CalendarSettings.today)
  }()
  @ViewBuilder let content: () -> Content

  var body: some View {
    content()
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Image(systemName: "list.bullet.below.rectangle")
            .opacity(0.1)
          Rectangle()
            .frame(width: 0, height: 0)
            .hidden()
          Image(systemName: "gearshape")
            .opacity(0.1)
        }
        ToolbarItem(placement: .bottomBar) {
          Image(systemName: "tag")
            .opacity(0.1)
        }
        ToolbarItem(placement: .status) {
          Text(toolbarDate)
            .font(.footnote)
        }
        ToolbarItem(placement: .bottomBar) {
          Image(systemName: "plus")
            .opacity(0.1)
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
