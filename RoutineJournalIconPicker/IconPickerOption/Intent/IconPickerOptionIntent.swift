public final class IconPickerOptionIntent {
  public typealias Intent = IconPickerOptionIntent
  public typealias Model = IconPickerOptionModel

  private weak var model: Model?

  public let selectAction: () -> Void

  public init(
    model: Model,
    selectAction: @escaping () -> Void = {}
  ) {
    self.model = model
    self.selectAction = selectAction
  }

  public func reinit(
    model: Model,
    selectAction: (() -> Void)? = nil
  ) -> Intent {
    Intent(
      model: model,
      selectAction: selectAction ?? self.selectAction
    )
  }

  public func onSelect() {
    model?.select()
    selectAction()
  }
}