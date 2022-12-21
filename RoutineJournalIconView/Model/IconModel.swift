import RoutineJournalCore
import RoutineJournalUI

public final class IconModel: Identifiable {
  public typealias Model = IconModel

  public let icon: IconObject
  public let colorTheme: ColorTheme
  public let size: Size

  public var id: ObjectIdentifier {
    ObjectIdentifier(icon._id)
  }
  public var systemName: String {
    icon.name.rawValue
  }
  public var colors: Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(
        foregroundColor: .white,
        backgroundColor: palette.color600
      )
    }
  }

  public init(
    icon: IconObject = .default,
    colorTheme: ColorTheme = .default,
    size: Size = .default
  ) {
    self.icon = icon
    self.colorTheme = colorTheme
    self.size = size
  }

  public func reinit(
    icon: IconObject? = nil,
    colorTheme: ColorTheme? = nil,
    size: Size? = nil
  ) -> Model {
    Model(
      icon: icon ?? self.icon,
      colorTheme: colorTheme ?? self.colorTheme,
      size: size ?? self.size
    )
  }
}