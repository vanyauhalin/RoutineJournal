import RoutineJournalCore
import SwiftUI

public final class EventFormEndsModel {
  public let title = "Ends"
  public var selection: Binding<Date>

  public init(selection: Binding<Date>) {
    self.selection = selection
  }

  public func updateSelection() {
    selection.wrappedValue = Date.now
  }

  public func resetSelection() {
    selection.wrappedValue = Date.since1970
  }
}
