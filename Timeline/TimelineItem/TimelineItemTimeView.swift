import SwiftUI

struct TimelineItemTimeView: View {
  let date: Date
  let foregroundColor: Color
  var time: String {
    TimelineItemTimeView.timeFormatter.string(from: date)
  }

  var body: some View {
    Text(time)
      .font(.subheadline)
      .foregroundColor(foregroundColor)
  }
}

extension TimelineItemTimeView {
  static let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    return formatter
  }()
}
