import Foundation
import RoutineJournalCore
import RoutineJournalUI

public final class TimelineItemEndDateModel: TimelineItemDateModelProtocol {
  public typealias Model = TimelineItemEndDateModel

  public let date: Date
  public var colors: Colors

  public init(from date: Date, colorTheme: ColorTheme = .neutral) {
    self.date = date
    self.colors = Model.colors(by: colorTheme)
  }

  public static func colors(by colorTheme: ColorTheme) -> Colors {
    Colors.create(from: colorTheme) { palette in
      Colors(foregroundColor: palette.color600)
    }
  }
}
