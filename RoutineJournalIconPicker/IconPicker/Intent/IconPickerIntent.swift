import RoutineJournalColorThemeModifier

public final class IconPickerIntent: MVIColorThemeModifierIntent {
  public typealias Model = IconPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}
