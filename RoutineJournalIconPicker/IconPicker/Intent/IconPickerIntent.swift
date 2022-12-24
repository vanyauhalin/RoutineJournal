import RoutineJournalMVI

public final class IconPickerIntent: MVIIntent {
  public typealias Model = IconPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}
