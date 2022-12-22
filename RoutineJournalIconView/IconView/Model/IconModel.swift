import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public final class IconModel: Identifiable {
  public typealias Model = IconModel

  public static let width: Double = 28
  public static let height: Double = 28
  public static let cornerRadius: Double = 7

  public let icon: IconObject
  public let colorTheme: ColorTheme

  public var id: ObjectIdentifier {
    ObjectIdentifier(icon._id)
  }
  public var systemName: String {
    icon.name.rawValue
  }
  public var colorPalette: ColorPalette {
    ColorPalette.select(by: colorTheme)
  }
  public var foregroundColor: Color {
    .white
  }
  public var backgroundColor: Color {
    colorPalette.color600
  }

  public init(
    icon: IconObject = .default,
    colorTheme: ColorTheme = .default
  ) {
    self.icon = icon
    self.colorTheme = colorTheme
  }

  public func reinit(
    icon: IconObject? = nil,
    colorTheme: ColorTheme? = nil
  ) -> Model {
    Model(
      icon: icon ?? self.icon,
      colorTheme: colorTheme ?? self.colorTheme
    )
  }
}
