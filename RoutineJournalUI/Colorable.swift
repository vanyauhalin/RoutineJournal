import RoutineJournalCore

public protocol Colorable: AnyObject {
  var colors: Colors { get set }

  static func colors(by colorTheme: ColorTheme) -> Colors
  func update(colorTheme: ColorTheme)
}

extension Colorable {
  public func update(colorTheme: ColorTheme) {
    self.colors = Self.colors(by: colorTheme)
  }
}
