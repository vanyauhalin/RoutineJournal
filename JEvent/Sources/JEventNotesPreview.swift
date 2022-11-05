import SwiftUI

struct JEventNotesPreview: View {
  let event: JEvent

  var body: some View {
    if let notes = event.notes {
      Text(notes)
        .font(.subheadline)
        .lineLimit(1)
        .foregroundColor(
          event.category.colorTheme.JCategoryItemNotesForegroundColor
        )
    }
  }
}
