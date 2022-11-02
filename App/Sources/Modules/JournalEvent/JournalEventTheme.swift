import SwiftUI

struct JournalEventTheme {
  let titleForegroundColor: Color
  let descriptionForegroundColor: Color
  let backgroundColor: Color
  var iconForegroundColor: Color {
    .white
  }
  var iconBackgroundColor: Color {
    descriptionForegroundColor
  }
}

extension JournalEventTheme {
  static let amber = JournalEventTheme(
    titleForegroundColor: .init("ColorAmber900"),
    descriptionForegroundColor: .init("ColorAmber600"),
    backgroundColor: .init("ColorAmber050")
  )
  static let blue = JournalEventTheme(
    titleForegroundColor: .init("ColorBlue900"),
    descriptionForegroundColor: .init("ColorBlue600"),
    backgroundColor: .init("ColorBlue050")
  )
  static let cyan = JournalEventTheme(
    titleForegroundColor: .init("ColorCyan900"),
    descriptionForegroundColor: .init("ColorCyan600"),
    backgroundColor: .init("ColorCyan050")
  )
  static let emerald = JournalEventTheme(
    titleForegroundColor: .init("ColorEmerald900"),
    descriptionForegroundColor: .init("ColorEmerald600"),
    backgroundColor: .init("ColorEmerald050")
  )
  static let fuchsia = JournalEventTheme(
    titleForegroundColor: .init("ColorFuchsia900"),
    descriptionForegroundColor: .init("ColorFuchsia600"),
    backgroundColor: .init("ColorFuchsia050")
  )
  static let gray = JournalEventTheme(
    titleForegroundColor: .init("ColorGray900"),
    descriptionForegroundColor: .init("ColorGray600"),
    backgroundColor: .init("ColorGray050")
  )
  static let green = JournalEventTheme(
    titleForegroundColor: .init("ColorGreen900"),
    descriptionForegroundColor: .init("ColorGreen600"),
    backgroundColor: .init("ColorGreen050")
  )
  static let indigo = JournalEventTheme(
    titleForegroundColor: .init("ColorIndigo900"),
    descriptionForegroundColor: .init("ColorIndigo600"),
    backgroundColor: .init("ColorIndigo050")
  )
  static let lime = JournalEventTheme(
    titleForegroundColor: .init("ColorLime900"),
    descriptionForegroundColor: .init("ColorLime600"),
    backgroundColor: .init("ColorLime050")
  )
  static let neutral = JournalEventTheme(
    titleForegroundColor: .init("ColorNeutral900"),
    descriptionForegroundColor: .init("ColorNeutral600"),
    backgroundColor: .init("ColorNeutral050")
  )
  static let orange = JournalEventTheme(
    titleForegroundColor: .init("ColorOrange900"),
    descriptionForegroundColor: .init("ColorOrange600"),
    backgroundColor: .init("ColorOrange050")
  )
  static let pink = JournalEventTheme(
    titleForegroundColor: .init("ColorPink900"),
    descriptionForegroundColor: .init("ColorPink600"),
    backgroundColor: .init("ColorPink050")
  )
  static let purple = JournalEventTheme(
    titleForegroundColor: .init("ColorPurple900"),
    descriptionForegroundColor: .init("ColorPurple600"),
    backgroundColor: .init("ColorPurple050")
  )
  static let red = JournalEventTheme(
    titleForegroundColor: .init("ColorRed900"),
    descriptionForegroundColor: .init("ColorRed600"),
    backgroundColor: .init("ColorRed050")
  )
  static let rose = JournalEventTheme(
    titleForegroundColor: .init("ColorRose900"),
    descriptionForegroundColor: .init("ColorRose600"),
    backgroundColor: .init("ColorRose050")
  )
  static let sky = JournalEventTheme(
    titleForegroundColor: .init("ColorSky900"),
    descriptionForegroundColor: .init("ColorSky600"),
    backgroundColor: .init("ColorSky050")
  )
  static let slate = JournalEventTheme(
    titleForegroundColor: .init("ColorSlate900"),
    descriptionForegroundColor: .init("ColorSlate600"),
    backgroundColor: .init("ColorSlate050")
  )
  static let stone = JournalEventTheme(
    titleForegroundColor: .init("ColorStone900"),
    descriptionForegroundColor: .init("ColorStone600"),
    backgroundColor: .init("ColorStone050")
  )
  static let teal = JournalEventTheme(
    titleForegroundColor: .init("ColorTeal900"),
    descriptionForegroundColor: .init("ColorTeal600"),
    backgroundColor: .init("ColorTeal050")
  )
  static let violet = JournalEventTheme(
    titleForegroundColor: .init("ColorViolet900"),
    descriptionForegroundColor: .init("ColorViolet600"),
    backgroundColor: .init("ColorViolet050")
  )
  static let yellow = JournalEventTheme(
    titleForegroundColor: .init("ColorYellow900"),
    descriptionForegroundColor: .init("ColorYellow600"),
    backgroundColor: .init("ColorYellow050")
  )
  static let zinc = JournalEventTheme(
    titleForegroundColor: .init("ColorZinc900"),
    descriptionForegroundColor: .init("ColorZinc600"),
    backgroundColor: .init("ColorZinc050")
  )
}
