import RoutineJournalCore
import RoutineJournalJCategory
import RoutineJournalJEvent
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
        realm.add(JCategoryConfiguration.exampleData())
        realm.add(JEventConfiguration.exampleData())
      }
    } catch {
      //
    }
  }
  #endif
}
