import RoutineJournalSelectionModifier

public final class IconPickerOptionsIntent: SelectionModifier {
  public typealias Model = IconPickerOptionsModel

  public weak var model: Model?
  public var selectionAction: (() -> Void)?

  public init() {}
}
