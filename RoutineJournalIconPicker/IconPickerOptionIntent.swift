import RoutineJournalSelectionModifier

public final class IconPickerOptionIntent: SelectionModifier {
  public typealias Model = IconPickerOptionModel

  public weak var model: Model?
  public var selectionAction: (() -> Void)?

  public init() {}

  public func onSelect() {
    model?.select()
    selectionAction?()
  }
}
