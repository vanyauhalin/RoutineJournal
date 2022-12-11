import SwiftUI

public final class EventFormNotesModel {
  public let title = "Notes"
  public let text: Binding<String>

  public init(text: Binding<String>) {
    self.text = text
  }
}
