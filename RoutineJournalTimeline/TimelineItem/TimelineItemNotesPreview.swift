import SwiftUI

struct TimelineItemNotesPreview: View {
  let notes: String
  let foregroundColor: Color

  var body: some View {
    Text(notes)
      .font(.subheadline)
      .lineLimit(1)
      .foregroundColor(foregroundColor)
  }
}
