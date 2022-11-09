import RoutineJournalUI
import SwiftUI

struct TimelineItemIconView: View {
  let icon: Icon
  let foregroundColor: Color
  let backgroundColor: Color

  var body: some View {
    Image(systemName: icon.name.rawValue)
      .foregroundColor(foregroundColor)
      .frame(
        width: TimelineItemIconView.width,
        height: TimelineItemIconView.height
      )
      .background(
        RoundedRectangle(cornerRadius: TimelineItemIconView.cornerRadius)
          .foregroundColor(backgroundColor)
      )
  }
}

extension TimelineItemIconView {
  static let width: CGFloat = 28
  static let height: CGFloat = 28
  static let cornerRadius: CGFloat = 7
}
