import SwiftUI

struct JEventTitleView: View {
  let title: String
  let foregroundColor: Color

  var body: some View {
    Text(title)
      .font(.headline)
      .lineLimit(1)
      .foregroundColor(foregroundColor)
  }
}
