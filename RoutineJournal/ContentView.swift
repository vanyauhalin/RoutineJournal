import RealmSwift
import RoutineJournalCategory
import RoutineJournalCore
import RoutineJournalEvent
import RoutineJournalTimeline
import RoutineJournalUI
import SwiftUI

struct ContentView: View {
  @ObservedResults(Event.self) var events

  var body: some View {
    NavigationView {
      ContentViewToolbar {
        VStack(spacing: 8) {
          ForEach(events) { event in
            TimelineEventView(
              viewModel: TimelineEventViewModel(event: event)
            )
          }
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
    return formatter.string(from: Date.now)
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
