import SwiftUI

public struct JEventView: View {
  let event: JEvent

  var eventDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm"
    return formatter
  }()
  var eventStartDate: String {
    eventDateFormatter.string(from: event.startDate)
  }
  var eventEndDate: String {
    if let endDate = event.endDate {
      return eventDateFormatter.string(from: endDate)
    }
    return ""
  }

  public var body: some View {
    JEventLabelView(
      title: {
        VStack(alignment: .leading, spacing: .zero) {
          JEventTitleView(event: event)
          JEventNotesPreview(event: event)
        }
        Spacer(minLength: 8)
        VStack(alignment: .trailing, spacing: .zero) {
          Text(eventStartDate)
            .font(.subheadline)
            .foregroundColor(
              event.category.colorTheme.JCategoryItemTitleForegroundColor
            )
          Text(eventEndDate)
            .font(.subheadline)
            .foregroundColor(
              event.category.colorTheme.JCategoryItemNotesForegroundColor
            )
        }
      },
      icon: {
        JEventIconView(event: event)
      }
    )
    .padding([.horizontal])
    .padding([.vertical], 8)
    .background {
      Rectangle()
        .foregroundColor(
          event.category.colorTheme.JCategoryItemBackgroundColor
        )
        .cornerRadius(10)
    }
  }

  public init(event: JEvent) {
    self.event = event
  }
}
