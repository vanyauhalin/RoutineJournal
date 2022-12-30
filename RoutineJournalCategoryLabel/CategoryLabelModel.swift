import RoutineJournalCategoryModifier
import RoutineJournalCore

public final class CategoryLabelModel: CategoryModifier {
  public var category: CategoryObject?

  public var title: String? {
    category?.title
  }
  public var icon: IconObject? {
    category?.icon
  }
  public var colorTheme: ColorTheme? {
    category?.colorTheme
  }

  public init() {}
}
