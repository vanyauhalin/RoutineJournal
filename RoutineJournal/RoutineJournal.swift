import RoutineJournalCore
import RoutineJournalHome
import RoutineJournalUI
import SwiftUI

@main
struct RoutineJournal: App {
  var body: some Scene {
    WindowGroup {
      DataProvider.ExamplesView(Self.name) {
        HomeView
          .render(Date.now)
      }
    }
  }

  // #if ADD_EXAMPLES
  // init() {
  //   try? DataProvider.addExamples()
  // }
  // #endif
}
