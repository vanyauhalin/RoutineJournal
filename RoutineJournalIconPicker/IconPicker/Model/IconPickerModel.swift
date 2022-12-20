import RoutineJournalCore
import SwiftUI

public final class IconPickerModel: ObservableObject {
  public typealias Model = IconPickerModel

  public let title = "Icon"
  public let selectionIcon: Binding<IconObject>
  public let colorTheme: ColorTheme
  @Published public var explorerShowing: Bool

  public init(
    selectionIcon: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default,
    explorerShowing: Bool = false
  ) {
    self.selectionIcon = selectionIcon
    self.colorTheme = colorTheme
    self.explorerShowing = explorerShowing
  }

  public func reinit(
    selectionIcon: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil,
    explorerShowing: Bool? = nil
  ) -> Model {
    Model(
      selectionIcon: selectionIcon ?? self.selectionIcon,
      colorTheme: colorTheme ?? self.colorTheme,
      explorerShowing: explorerShowing ?? self.explorerShowing
    )
  }

  public func showExplorer() {
    explorerShowing = true
  }
}
