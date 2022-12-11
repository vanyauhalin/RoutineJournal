import SwiftUI

public final class EventFormStartsModel {
  public let title = "Starts"
  public let selection: Binding<Date>

  public init(selection: Binding<Date>) {
    self.selection = selection
  }
}
