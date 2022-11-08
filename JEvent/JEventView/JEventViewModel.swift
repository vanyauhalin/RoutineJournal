import RoutineJournalUI
import SwiftUI

class JEventViewModel {
  let event: JEvent

  init(event: JEvent) {
    self.event = event
  }
}

extension JEventViewModel {
  var colorPalette: ColorPalette {
    ColorPalette.select(by: .blue)
    // ColorPalette.select(by: event.category.colorTheme)
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
