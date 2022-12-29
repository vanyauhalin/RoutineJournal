import RoutineJournalSelectionModifier

public final class CategoryPickerOptionIntent: SelectionModifier {
  public typealias Model = CategoryPickerOptionModel

  public weak var model: Model?
  public var selectionAction: (() -> Void)?

  public init() {}

  public func onSelect() {
    model?.select()
    selectionAction?()
  }
}
