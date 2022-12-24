import RoutineJournalMVI

public final class CategoryPickerIntent: MVIIntent {
  public typealias Model = CategoryPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}
