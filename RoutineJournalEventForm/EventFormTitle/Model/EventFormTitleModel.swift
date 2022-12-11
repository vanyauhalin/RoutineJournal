import SwiftUI

public final class EventFormTitleModel {
  public let title = "Title"
  public let text: Binding<String>

  public init(text: Binding<String>) {
    self.text = text
  }
}
