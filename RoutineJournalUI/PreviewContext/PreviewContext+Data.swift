#if DEBUG
import RoutineJournalCore
import SwiftUI

extension PreviewContext {
  public struct Data: View {
    public var body: some View {
      HStack(spacing: .zero) {
        Text("data: ")
        Button("add") {
          try? DataProvider.addExamples()
        }
        Text(" ")
        Button("delete") {
          try? DataProvider.deleteExamples()
        }
      }
    }

    public init(identifier: String) {
      DataProvider.useMemory(identifier)
    }
  }
}
#endif
