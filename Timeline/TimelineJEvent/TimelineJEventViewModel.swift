import RoutineJournalJEvent
import RoutineJournalUI
import SwiftUI

public class TimelineJEventViewModel {
  public let event: JEvent

  public init(event: JEvent) {
    self.event = event
  }
}

public extension TimelineJEventViewModel {
  var colorPalette: ColorPalette {
    ColorPalette.select(by: event.category?.colorTheme ?? .neutral)
  }
  var titleForegroundColor: Color {
    colorPalette.color900
  }
  var notesForegroundColor: Color {
    colorPalette.color600
  }
  var backgroundColor: Color {
    colorPalette.color050
  }
  var iconForegroundColor: Color {
    .white
  }
  var iconBackgroundColor: Color {
    notesForegroundColor
  }
  var startDateForegroundColor: Color {
    titleForegroundColor
  }
  var endDateForegroundColor: Color {
    notesForegroundColor
  }
}
