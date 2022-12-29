import RoutineJournalMVI

public final class NavigationButtonCategoryDetailsStyleIntent: MVIIntent {
  public typealias Model = NavigationButtonCategoryDetailsStyleModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showContent()
  }

  public func onCancel() {
    model?.hideContent()
  }

  public func onConfirm() {
    model?.hideContent()
  }

  public func onDelete() {
    model?.hideContent()
  }
}
