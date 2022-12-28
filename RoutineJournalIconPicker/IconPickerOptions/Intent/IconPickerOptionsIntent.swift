import RoutineJournalOnSelectModifier

public final class IconPickerOptionsIntent: OnSelectModifier {
  public typealias Model = IconPickerOptionsModel

  public weak var model: Model?
  public var actionOnSelect: () -> Void

  public init() {
    self.actionOnSelect = {}
  }
}
