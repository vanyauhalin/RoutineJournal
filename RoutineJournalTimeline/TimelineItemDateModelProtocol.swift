import Foundation
import RoutineJournalCore
import RoutineJournalUI

public protocol TimelineItemDateModelProtocol: AnyObject, Colorable {
  var date: Date { get }

  init(from date: Date, colorTheme: ColorTheme)
}

extension TimelineItemDateModelProtocol {
  public var string: String {
    formatter().string(from: date)
  }
  public var characters: [String] {
    string.map { character in
      String(character)
    }
  }
  public var charactersWithWidth: [(String, Double)] {
    [
      (Optional(characters[0]) ?? "?", 9.5),
      (Optional(characters[1]) ?? "?", 9.5),
      (":", 6.0),
      (Optional(characters[3]) ?? "?", 9.5),
      (Optional(characters[4]) ?? "?", 9.5)
    ]
  }

  public func formatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    return formatter
  }
}
