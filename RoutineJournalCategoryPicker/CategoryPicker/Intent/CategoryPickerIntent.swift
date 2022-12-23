import RoutineJournalCategorySelectionModifier

public final class CategoryPickerIntent: MVICategorySelectionModifierIntent {
  public typealias Model = CategoryPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}

