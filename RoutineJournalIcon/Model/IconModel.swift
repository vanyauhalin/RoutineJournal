import RoutineJournalCore
import RoutineJournalUI

public final class IconModel: Identifiable {
  public typealias Model = IconModel

  public let id: ObjectIdentifier
  public let icon: IconObject
  public let colorTheme: ColorTheme
  public var size: Size

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
    self.id = ObjectIdentifier(icon._id)
    self.icon = icon
    self.colorTheme = colorTheme
    self.size = size
  }

  public func update(size: Size) {
    self.size = size
  }
}
