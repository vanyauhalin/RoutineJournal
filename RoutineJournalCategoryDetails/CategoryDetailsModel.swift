import Combine
import Foundation
import RoutineJournalCategoryModifier
import RoutineJournalCore
import RoutineJournalFoundation

public final class CategoryDetailsModel:
  ObservableObject,
  CategoryModifier
{
  public static let title = "Edit Calendar"

  public var category: CategoryObject?
  @Published
  public var name: String
  @Published
  public var icon: IconObject
  @Published
  public var colorTheme: ColorTheme

  public init() {
    self.name = .default
    self.icon = .default
    self.colorTheme = .default
  }

  public func reinit(category: CategoryObject?) -> Self {
    guard let category else { return self }
    self.category = category
    self.name = category.title
    self.icon = category.icon ?? .default
    self.colorTheme = category.colorTheme
    return self
  }
}
