import SwiftUI

struct JournalEventTitleView: View {
  let theme: JournalEventTheme
  let title: String

  var body: some View {
    Text(title)
      .font(.headline)
      .lineLimit(1)
      .foregroundColor(theme.titleForegroundColor)
  }
}
