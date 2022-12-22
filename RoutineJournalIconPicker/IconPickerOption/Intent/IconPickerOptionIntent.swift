import RoutineJournalColorThemeModifier

public final class IconPickerOptionIntent: MVIColorThemeModifierIntent {
  public typealias Intent = IconPickerOptionIntent
  public typealias Model = IconPickerOptionModel

  public weak var model: Model?

  public let selectAction: () -> Void

  public init() {
    self.selectAction = {}
  }

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
