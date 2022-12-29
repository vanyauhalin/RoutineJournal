import RoutineJournalSelectionModifier

public final class CategoryPickerOptionsIntent: SelectionModifier {
  public typealias Model = CategoryPickerOptionsModel

  public weak var model: Model?
  public var selectionAction: (() -> Void)?

  public init() {}
}
