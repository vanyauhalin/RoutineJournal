import SwiftUI

struct TimelineItemTimeView: View {
  typealias TimeCharacterWithWidth = (String, CGFloat)

  let date: Date
  let foregroundColor: Color

  var time: String {
    TimelineItemTimeView.timeFormatter.string(from: date)
  }
  var timeCharacters: [String] {
    time.map { character in
      String(character)
    }
  }
  var timeCharactersWithWidth: [TimeCharacterWithWidth] {
    [
      (Optional(timeCharacters[0]) ?? "?", 9.5),
      (Optional(timeCharacters[1]) ?? "?", 9.5),
      (":", 6.0),
      (Optional(timeCharacters[3]) ?? "?", 9.5),
      (Optional(timeCharacters[4]) ?? "?", 9.5)
    ]
  }

  var body: some View {
    HStack(spacing: .zero) {
      ForEach(
        Array(timeCharactersWithWidth.enumerated()),
        id: \.offset
      ) { _, timeCharacterWithWidth in
        TimelineItemTimeCharacterView(
          character: timeCharacterWithWidth.0,
          width: timeCharacterWithWidth.1,
          foregroundColor: foregroundColor
        )
      }
    }
  }
}

extension TimelineItemTimeView {
  static let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    return formatter
  }()
}
