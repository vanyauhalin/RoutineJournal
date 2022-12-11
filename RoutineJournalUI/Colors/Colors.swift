import RoutineJournalCore
import SwiftUI

public struct Colors {
  public let foregroundColor: Color?
  public let backgroundColor: Color?

  public init(foregroundColor: Color? = nil, backgroundColor: Color? = nil) {
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
  }

  public static func create(
    from colorTheme: ColorTheme,
    initializer: @escaping (ColorPalette) -> Colors
  ) -> Colors {
    let palette = ColorPalette.select(by: colorTheme)
    return initializer(palette)
  }
}
