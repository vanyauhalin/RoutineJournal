import RoutineJournalUI
import SwiftUI

struct JEventIconView: View {
  let icon: Icon
  let foregroundColor: Color
  let backgroundColor: Color

  var body: some View {
    Image(systemName: icon.name.rawValue)
      .foregroundColor(foregroundColor)
      .frame(width: JEventIconView.width, height: JEventIconView.height)
      .background(
        RoundedRectangle(cornerRadius: JEventIconView.cornerRadius)
          .foregroundColor(backgroundColor)
      )
  }
}

extension JEventIconView {
  static let width: CGFloat = 28
  static let height: CGFloat = 28
  static let cornerRadius: CGFloat = 7
}
