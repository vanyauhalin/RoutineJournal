import SwiftUI

struct JEventTitleView: View {
  let event: JEvent

  var body: some View {
    Text(event.title)
      .font(.headline)
      .lineLimit(1)
      .foregroundColor(
        event.category.colorTheme.JCategoryItemTitleForegroundColor
      )
  }
}
