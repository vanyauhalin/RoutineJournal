#if DEBUG
import RoutineJournalCore
import SwiftUI

extension PreviewContext {
  public struct Counter: View {
    public let counter: Binding<Int>

    public var body: some View {
      HStack(spacing: .zero) {
        Text("counter: ")
        Text(counter.wrappedValue.description)
      }
    }

    public init(counter: Binding<Int>) {
      self.counter = counter
    }
  }
}
#endif
