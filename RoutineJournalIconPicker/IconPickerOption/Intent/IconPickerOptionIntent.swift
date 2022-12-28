import RoutineJournalOnSelectModifier

public final class IconPickerOptionIntent: OnSelectModifier {
  public typealias Model = IconPickerOptionModel

  public weak var model: Model?
  public var actionOnSelect: (() -> Void)?

  public init() {}

  public func onSelect() {
    model?.select()
    actionOnSelect?()
  }
}
