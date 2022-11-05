import RoutineJournalUI

public class JCategory {
  public private(set) var title: String
  public private(set) var colorTheme: ColorTheme
  public private(set) var icon: Icon

  public init(title: String, colorTheme: ColorTheme, icon: Icon) {
    self.title = title
    self.colorTheme = colorTheme
    self.icon = icon
  }

  public func update(title: String) {
    self.title = title
  }

  public func select(colorTheme: ColorTheme) {
    self.colorTheme = colorTheme
  }

  public func select(icon: Icon) {
    self.icon = icon
  }
}
