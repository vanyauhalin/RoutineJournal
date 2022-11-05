import Foundation
import SwiftUI

public enum ColorThemeName: String {
  case amber
  case blue
  case cyan
  case emerald
  case fuchsia
  case gray
  case green
  case indigo
  case lime
  case neutral
  case orange
  case pink
  case purple
  case red
  case rose
  case sky
  case slate
  case stone
  case teal
  case violet
  case yellow
  case zinc
}

public struct ColorTheme {
  public let name: String
  public let JCategoryItemTitleForegroundColor: Color
  public let JCategoryItemNotesForegroundColor: Color
  public let JCategoryItemBackgroundColor: Color
  public let JCategoryItemIconForegroundColor: Color
  public let JCategoryItemIconBackgroundColor: Color

  init(
    name: String,
    JCategoryItemTitleForegroundColor: Color,
    JCategoryItemNotesForegroundColor: Color,
    JCategoryItemBackgroundColor: Color
  ) {
    self.name
      = name
    self.JCategoryItemTitleForegroundColor
      = JCategoryItemTitleForegroundColor
    self.JCategoryItemNotesForegroundColor
      = JCategoryItemNotesForegroundColor
    self.JCategoryItemBackgroundColor
      = JCategoryItemBackgroundColor
    self.JCategoryItemIconForegroundColor
      = .white
    self.JCategoryItemIconBackgroundColor
      = JCategoryItemNotesForegroundColor
  }
}

public extension ColorTheme {
  static let amber = ColorTheme(
    name: ColorThemeName.amber.rawValue,
    JCategoryItemTitleForegroundColor: .amber900,
    JCategoryItemNotesForegroundColor: .amber600,
    JCategoryItemBackgroundColor: .amber050
  )
  static let blue = ColorTheme(
    name: ColorThemeName.blue.rawValue,
    JCategoryItemTitleForegroundColor: .blue900,
    JCategoryItemNotesForegroundColor: .blue600,
    JCategoryItemBackgroundColor: .blue050
  )
  static let cyan = ColorTheme(
    name: ColorThemeName.cyan.rawValue,
    JCategoryItemTitleForegroundColor: .cyan900,
    JCategoryItemNotesForegroundColor: .cyan600,
    JCategoryItemBackgroundColor: .cyan050
  )
  static let emerald = ColorTheme(
    name: ColorThemeName.emerald.rawValue,
    JCategoryItemTitleForegroundColor: .emerald900,
    JCategoryItemNotesForegroundColor: .emerald600,
    JCategoryItemBackgroundColor: .emerald050
  )
  static let fuchsia = ColorTheme(
    name: ColorThemeName.fuchsia.rawValue,
    JCategoryItemTitleForegroundColor: .fuchsia900,
    JCategoryItemNotesForegroundColor: .fuchsia600,
    JCategoryItemBackgroundColor: .fuchsia050
  )
  static let gray = ColorTheme(
    name: ColorThemeName.gray.rawValue,
    JCategoryItemTitleForegroundColor: .gray900,
    JCategoryItemNotesForegroundColor: .gray600,
    JCategoryItemBackgroundColor: .gray050
  )
  static let green = ColorTheme(
    name: ColorThemeName.green.rawValue,
    JCategoryItemTitleForegroundColor: .green900,
    JCategoryItemNotesForegroundColor: .green600,
    JCategoryItemBackgroundColor: .green050
  )
  static let indigo = ColorTheme(
    name: ColorThemeName.indigo.rawValue,
    JCategoryItemTitleForegroundColor: .indigo900,
    JCategoryItemNotesForegroundColor: .indigo600,
    JCategoryItemBackgroundColor: .indigo050
  )
  static let lime = ColorTheme(
    name: ColorThemeName.lime.rawValue,
    JCategoryItemTitleForegroundColor: .lime900,
    JCategoryItemNotesForegroundColor: .lime600,
    JCategoryItemBackgroundColor: .lime050
  )
  static let neutral = ColorTheme(
    name: ColorThemeName.neutral.rawValue,
    JCategoryItemTitleForegroundColor: .neutral900,
    JCategoryItemNotesForegroundColor: .neutral600,
    JCategoryItemBackgroundColor: .neutral050
  )
  static let orange = ColorTheme(
    name: ColorThemeName.orange.rawValue,
    JCategoryItemTitleForegroundColor: .orange900,
    JCategoryItemNotesForegroundColor: .orange600,
    JCategoryItemBackgroundColor: .orange050
  )
  static let pink = ColorTheme(
    name: ColorThemeName.pink.rawValue,
    JCategoryItemTitleForegroundColor: .pink900,
    JCategoryItemNotesForegroundColor: .pink600,
    JCategoryItemBackgroundColor: .pink050
  )
  static let purple = ColorTheme(
    name: ColorThemeName.purple.rawValue,
    JCategoryItemTitleForegroundColor: .purple900,
    JCategoryItemNotesForegroundColor: .purple600,
    JCategoryItemBackgroundColor: .purple050
  )
  static let red = ColorTheme(
    name: ColorThemeName.red.rawValue,
    JCategoryItemTitleForegroundColor: .red900,
    JCategoryItemNotesForegroundColor: .red600,
    JCategoryItemBackgroundColor: .red050
  )
  static let rose = ColorTheme(
    name: ColorThemeName.rose.rawValue,
    JCategoryItemTitleForegroundColor: .rose900,
    JCategoryItemNotesForegroundColor: .rose600,
    JCategoryItemBackgroundColor: .rose050
  )
  static let sky = ColorTheme(
    name: ColorThemeName.sky.rawValue,
    JCategoryItemTitleForegroundColor: .sky900,
    JCategoryItemNotesForegroundColor: .sky600,
    JCategoryItemBackgroundColor: .sky050
  )
  static let slate = ColorTheme(
    name: ColorThemeName.slate.rawValue,
    JCategoryItemTitleForegroundColor: .slate900,
    JCategoryItemNotesForegroundColor: .slate600,
    JCategoryItemBackgroundColor: .slate050
  )
  static let stone = ColorTheme(
    name: ColorThemeName.stone.rawValue,
    JCategoryItemTitleForegroundColor: .stone900,
    JCategoryItemNotesForegroundColor: .stone600,
    JCategoryItemBackgroundColor: .stone050
  )
  static let teal = ColorTheme(
    name: ColorThemeName.teal.rawValue,
    JCategoryItemTitleForegroundColor: .teal900,
    JCategoryItemNotesForegroundColor: .teal600,
    JCategoryItemBackgroundColor: .teal050
  )
  static let violet = ColorTheme(
    name: ColorThemeName.violet.rawValue,
    JCategoryItemTitleForegroundColor: .violet900,
    JCategoryItemNotesForegroundColor: .violet600,
    JCategoryItemBackgroundColor: .violet050
  )
  static let yellow = ColorTheme(
    name: ColorThemeName.yellow.rawValue,
    JCategoryItemTitleForegroundColor: .yellow900,
    JCategoryItemNotesForegroundColor: .yellow600,
    JCategoryItemBackgroundColor: .yellow050
  )
  static let zinc = ColorTheme(
    name: ColorThemeName.zinc.rawValue,
    JCategoryItemTitleForegroundColor: .zinc900,
    JCategoryItemNotesForegroundColor: .zinc600,
    JCategoryItemBackgroundColor: .zinc050
  )
}
