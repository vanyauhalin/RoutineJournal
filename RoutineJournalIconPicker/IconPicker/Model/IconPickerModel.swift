import RoutineJournalColorThemeModifier
import RoutineJournalCore
import SwiftUI

public final class IconPickerModel: ObservableObject, ColorThemeModifierModel {
  public typealias Model = IconPickerModel

  public static let title = "Icon"

  @Published
  public var showingExplorer = false

  public let iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme

  public var icon: IconObject {
    iconSelection.wrappedValue
  }

  public init() {
    self.iconSelection = .constant(.default)
    self.colorTheme = .default
  }

  public init(
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default
  ) {
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
  }

  public func reinit(
    iconSelection: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      iconSelection: iconSelection ?? self.iconSelection,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }

  public func showExplorer() {
    showingExplorer = true
  }
}
