import RoutineJournalCore
import SwiftUI

public final class EventFormCategoryModel: ObservableObject {
  public let object: Binding<CategoryObject?>
  @Published public var searchShowing = false

  public var title: String {
    object.wrappedValue?.title ?? "Category"
  }
  public var foregroundColor: Color {
    (object.wrappedValue == nil) ? .placeholderText : .black
  }
  public var icon: IconObject? {
    object.wrappedValue?.icon
  }
  public var colorTheme: ColorTheme? {
    object.wrappedValue?.colorTheme
  }

  public init(object: Binding<CategoryObject?>) {
    self.object = object
  }

  public func showSearch() {
    searchShowing = true
  }
}
