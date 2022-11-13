import RoutineJournalCategory
import RoutineJournalCore
import RoutineJournalEvent
import RoutineJournalUI
import SwiftUI

@main
struct RoutineJournal: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }

  #if ADD_EXAMPLE_DATA
  init() {
    do {
      try DataProvider.write { realm in
        realm.add(IconConfiguration.exampleData())
        realm.add(CategoryConfiguration.exampleData())
        realm.add(EventConfiguration.exampleData())
      }
    } catch {
      //
    }
  }
  #endif
}
