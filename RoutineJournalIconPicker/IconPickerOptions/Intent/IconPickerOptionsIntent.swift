public final class IconPickerOptionsIntent {
  public typealias Intent = IconPickerOptionsIntent

  public let selectAction: () -> Void

  public init(selectAction: @escaping () -> Void = {}) {
    self.selectAction = selectAction
  }

  public func reinit(selectAction: (() -> Void)? = nil) -> Intent {
    Intent(selectAction: selectAction ?? self.selectAction)
  }

  public func onSelect() {
    selectAction()
  }
}
