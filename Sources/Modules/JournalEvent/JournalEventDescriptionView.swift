import SwiftUI

struct JournalEventDescriptionView: View {
  let theme: JournalEventTheme
  let description: String

  var body: some View {
    Text(description)
      .font(.subheadline)
      .lineLimit(1)
      .foregroundColor(theme.descriptionForegroundColor)
  }
}
