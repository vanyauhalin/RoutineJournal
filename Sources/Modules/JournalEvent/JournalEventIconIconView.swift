import SwiftUI

struct JournalEventIconView: View {
  let theme: JournalEventTheme
  let systemImage: String
  let width: CGFloat = 28
  let cornerRadius: CGFloat = 7

  var body: some View {
    Image(systemName: systemImage)
      .foregroundColor(theme.iconForegroundColor)
      .frame(width: width, height: width)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .foregroundColor(theme.iconBackgroundColor)
      )
  }
}
