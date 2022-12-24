import RoutineJournalSelectModifier

public final class IconPickerOptionsIntent: SelectModifier {
  public typealias Model = IconPickerOptionsModel

  public weak var model: Model?

  public var selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

  public func onSelect() {
    selectAction()
  }
}
