import Foundation

public final class ListItemCategoryFormStyleModel: ObservableObject {
  public static let title = "Add Category"
  public static let systemImage = "plus"

  @Published
  public var showingForm = false

  public init() {}

  public func showForm() {
    showingForm = true
  }

  public func hideForm() {
    showingForm = false
  }
}
