import SwiftUI

struct TimelineItemTimeCharacterView: View {
  let character: String
  let width: CGFloat
  let foregroundColor: Color

  var body: some View {
    Text(character)
      .frame(width: width, alignment: .center)
      .font(.subheadline)
      .foregroundColor(foregroundColor)
  }
}
