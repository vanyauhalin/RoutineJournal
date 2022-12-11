import RoutineJournalCore
import RoutineJournalUI

public final class IconModel: Identifiable, Colorable {
  public typealias Model = IconModel

  public let id: ObjectIdentifier
  public let object: IconObject
  public var size: Size
  public var colors: Colors

  public init(
    from object: IconObject,
    size: Size = Size.medium,
    colorTheme: ColorTheme = .neutral
  ) {
    self.id = ObjectIdentifier(object._id)
    self.object = object
    self.size = size
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(
        foregroundColor: .white,
        backgroundColor: palette.color600
      )
    }
  }

  public func update(size: Size) {
    self.size = size
  }
}
