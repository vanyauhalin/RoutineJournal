import RoutineJournalMVI
import SwiftUI

public protocol MVIQueryModifierModel: MVIModel, QueryModifierModel {}

extension MVIQueryModifierModel {
  public func reinit(query: Binding<String>) -> Self {
    self.query = query
    return self
  }
}
