import RoutineJournalColorThemeModifier

public final class IconPickerIntent: ColorThemeModifierIntent {
  public typealias Model = IconPickerModel

  public weak var model: Model?

  public init() {}

  public func onPress() {
    model?.showExplorer()
  }
}
