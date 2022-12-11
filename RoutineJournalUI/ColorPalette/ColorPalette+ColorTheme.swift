import RoutineJournalCore

extension ColorPalette {
  public static let amber = ColorPalette(
    color050: .amber050,
    color600: .amber600,
    color900: .amber900
  )
  public static let blue = ColorPalette(
    color050: .blue050,
    color600: .blue600,
    color900: .blue900
  )
  public static let cyan = ColorPalette(
    color050: .cyan050,
    color600: .cyan600,
    color900: .cyan900
  )
  public static let emerald = ColorPalette(
    color050: .emerald050,
    color600: .emerald600,
    color900: .emerald900
  )
  public static let fuchsia = ColorPalette(
    color050: .fuchsia050,
    color600: .fuchsia600,
    color900: .fuchsia900
  )
  public static let gray = ColorPalette(
    color050: .gray050,
    color600: .gray600,
    color900: .gray900
  )
  public static let green = ColorPalette(
    color050: .green050,
    color600: .green600,
    color900: .green900
  )
  public static let indigo = ColorPalette(
    color050: .indigo050,
    color600: .indigo600,
    color900: .indigo900
  )
  public static let lime = ColorPalette(
    color050: .lime050,
    color600: .lime600,
    color900: .lime900
  )
  public static let neutral = ColorPalette(
    color050: .neutral050,
    color600: .neutral600,
    color900: .neutral900
  )
  public static let orange = ColorPalette(
    color050: .orange050,
    color600: .orange600,
    color900: .orange900
  )
  public static let pink = ColorPalette(
    color050: .pink050,
    color600: .pink600,
    color900: .pink900
  )
  public static let purple = ColorPalette(
    color050: .purple050,
    color600: .purple600,
    color900: .purple900
  )
  public static let red = ColorPalette(
    color050: .red050,
    color600: .red600,
    color900: .red900
  )
  public static let rose = ColorPalette(
    color050: .rose050,
    color600: .rose600,
    color900: .rose900
  )
  public static let sky = ColorPalette(
    color050: .sky050,
    color600: .sky600,
    color900: .sky900
  )
  public static let slate = ColorPalette(
    color050: .slate050,
    color600: .slate600,
    color900: .slate900
  )
  public static let stone = ColorPalette(
    color050: .stone050,
    color600: .stone600,
    color900: .stone900
  )
  public static let teal = ColorPalette(
    color050: .teal050,
    color600: .teal600,
    color900: .teal900
  )
  public static let violet = ColorPalette(
    color050: .violet050,
    color600: .violet600,
    color900: .violet900
  )
  public static let yellow = ColorPalette(
    color050: .yellow050,
    color600: .yellow600,
    color900: .yellow900
  )
  public static let zinc = ColorPalette(
    color050: .zinc050,
    color600: .zinc600,
    color900: .zinc900
  )

  // swiftlint:disable:next cyclomatic_complexity
  public static func select(by theme: ColorTheme) -> ColorPalette {
    switch theme {
      case .amber:
        return .amber
      case .blue:
        return .blue
      case .cyan:
        return .cyan
      case .emerald:
        return .emerald
      case .fuchsia:
        return .fuchsia
      case .gray:
        return .gray
      case .green:
        return .green
      case .indigo:
        return .indigo
      case .lime:
        return .lime
      case .neutral:
        return .neutral
      case .orange:
        return .orange
      case .pink:
        return .pink
      case .purple:
        return .purple
      case .red:
        return .red
      case .rose:
        return .rose
      case .sky:
        return .sky
      case .slate:
        return .slate
      case .stone:
        return .stone
      case .teal:
        return .teal
      case .violet:
        return .violet
      case .yellow:
        return .yellow
      case .zinc:
        return .zinc
    }
  }
}
