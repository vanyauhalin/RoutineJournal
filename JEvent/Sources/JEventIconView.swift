import SwiftUI

struct JEventIconView: View {
  static let width: CGFloat = 28
  static let cornerRadius: CGFloat = 7

  let event: JEvent

  var body: some View {
    Image(systemName: event.category.icon.name)
      .foregroundColor(
        event.category.colorTheme.JCategoryItemIconForegroundColor
      )
      .frame(width: JEventIconView.width, height: JEventIconView.width)
      .background(
        RoundedRectangle(cornerRadius: JEventIconView.cornerRadius)
          .foregroundColor(
            event.category.colorTheme.JCategoryItemIconBackgroundColor
          )
      )
  }
}
