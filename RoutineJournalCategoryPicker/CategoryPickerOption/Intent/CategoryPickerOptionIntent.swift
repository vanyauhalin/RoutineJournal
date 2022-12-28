import RoutineJournalOnSelectModifier

public final class CategoryPickerOptionIntent: OnSelectModifier {
  public typealias Model = CategoryPickerOptionModel

  public weak var model: Model?
  public var actionOnSelect: () -> Void

  public init() {
    self.actionOnSelect = {}
  }

  public func onSelect() {
    model?.select()
    actionOnSelect()
  }
}
