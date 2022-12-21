import RoutineJournalHomeView
import RoutineJournalUI
import SwiftUI

@main
struct RoutineJournal: App {
  var body: some Scene {
    WindowGroup {
      PreviewData(Self.name) {
        HomeView
          .render()
      }
    }
  }

  // #if ADD_EXAMPLES
  // init() {
  //   try? DataProvider.addExamples()
  // }
  // #endif
}
