import SwiftUI

struct CalendarWeekdaysView<Content>: View where Content: View {
  let weekdaySymbols: [String]
  @ViewBuilder var content: (String) -> Content

  var body: some View {
    HStack {
      Spacer()
      ForEach(weekdaySymbols, id: \.self) { weekdaySymbol in
        Spacer()
        content(weekdaySymbol)
        Spacer()
      }
      Spacer()
    }
  }
}
