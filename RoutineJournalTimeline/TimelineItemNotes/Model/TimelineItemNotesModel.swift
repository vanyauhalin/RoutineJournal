import RoutineJournalCore
import RoutineJournalUI

public final class TimelineItemNotesModel: Colorable {
  public typealias Model = TimelineItemNotesModel

  public let text: String
  public var colors: Colors

  public init(from text: String, colorTheme: ColorTheme = .neutral) {
    self.text = text
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(foregroundColor: palette.color600)
    }
  }
}
