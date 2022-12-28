import RealmSwift
import RoutineJournalFoundation

public enum ColorTheme: String, PersistableEnum {
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

  public static var `default`: ColorTheme {
    .neutral
  }

  public var name: String {
    self.rawValue.capitalized()
  }
}
