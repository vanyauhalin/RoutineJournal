import RoutineJournalCore
import RoutineJournalUI

public final class TimelineItemContainerModel: Colorable {
  public typealias Model = TimelineItemContainerModel

  public var colors: Colors

  public init(colorTheme: ColorTheme = .neutral) {
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(backgroundColor: palette.color050)
    }
  }
}
