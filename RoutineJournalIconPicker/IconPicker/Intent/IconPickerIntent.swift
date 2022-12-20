public final class IconPickerIntent {
  public typealias Intent = IconPickerIntent
  public typealias Model = IconPickerModel

  private weak var model: Model?

  public init(model: Model) {
    self.model = model
  }

  public func reinit(model: Model) -> Intent {
    Intent(model: model)
  }

  public func onPress() {
    model?.showExplorer()
  }
}
