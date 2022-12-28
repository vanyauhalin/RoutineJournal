import RoutineJournalOnSelectModifier

public final class CategoryPickerOptionsIntent: OnSelectModifier {
  public typealias Model = CategoryPickerOptionsModel

  public weak var model: Model?
  public var actionOnSelect: () -> Void

  public init() {
    self.actionOnSelect = {}
  }
}
