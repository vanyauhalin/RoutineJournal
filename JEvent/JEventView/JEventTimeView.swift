import SwiftUI

struct JEventTimeView: View {
  let date: Date
  let foregroundColor: Color
  var time: String {
    JEventTimeView.timeFormatter.string(from: date)
  }

  var body: some View {
    Text(time)
      .font(.subheadline)
      .foregroundColor(foregroundColor)
  }
}

extension JEventTimeView {
  static let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    return formatter
  }()
}
