import RoutineJournalHomeView
import RoutineJournalUI
import SwiftUI

@main
struct RoutineJournal: App {
  var body: some Scene {
    WindowGroup {
      PreviewContext { _ in
        HomeView()
      }
      .modifier(.data)
    }
  }

  // #if ADD_EXAMPLES
  // init() {
  //   try? DataProvider.addExamples()
  // }
  // #endif
}
