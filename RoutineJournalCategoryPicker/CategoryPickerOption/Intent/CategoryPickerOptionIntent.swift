import RoutineJournalSelectionModifier

public final class CategoryPickerOptionIntent: SelectionModifier {
  public typealias Model = CategoryPickerOptionModel

  public weak var model: Model?
  public var actionOnSelect: (() -> Void)?

  public init() {}

  public func onSelect() {
    model?.select()
    actionOnSelect?()
  }
}
