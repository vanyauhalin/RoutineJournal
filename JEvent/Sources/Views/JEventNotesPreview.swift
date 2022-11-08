import SwiftUI

struct JEventNotesPreview: View {
  let notes: String
  let foregroundColor: Color

  var body: some View {
    Text(notes)
      .font(.subheadline)
      .lineLimit(1)
      .foregroundColor(foregroundColor)
  }
}
