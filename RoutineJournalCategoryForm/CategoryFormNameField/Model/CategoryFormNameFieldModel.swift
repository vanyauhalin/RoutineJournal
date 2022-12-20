import RoutineJournalMVITextField
import SwiftUI

public final class CategoryFormNameFieldModel: MVITextFieldModel {
  public let title = "Category Name"
  public let text: Binding<String>

  public init(text: Binding<String>) {
    self.text = text
  }
}
