import RoutineJournalIconModifier
import RoutineJournalSelectModifier

public final class IconPickerOptionIntent: SelectModifier {
  public typealias Model = IconPickerOptionModel

  public weak var model: Model?

  public var selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

  public func onSelect() {
    model?.select()
    selectAction()
  }
}
