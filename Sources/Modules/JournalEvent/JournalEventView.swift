import SwiftUI

struct JournalEventView: View {
  let journalEvent: JournalEvent

  var body: some View {
    JournalEventLabelView(
      title: {
        VStack(alignment: .leading, spacing: .zero) {
          JournalEventTitleView(
            theme: journalEvent.theme,
            title: journalEvent.title
          )
          if let description = journalEvent.description {
            JournalEventDescriptionView(
              theme: journalEvent.theme,
              description: description
            )
          }
        }
        Spacer(minLength: 8)
        VStack(alignment: .trailing, spacing: .zero) {
          Text(journalEvent.startDate)
            .font(.subheadline)
            .foregroundColor(journalEvent.theme.titleForegroundColor)
          Text(journalEvent.endDate)
            .font(.subheadline)
            .foregroundColor(journalEvent.theme.descriptionForegroundColor)
        }
      },
      icon: {
        JournalEventIconView(
          theme: journalEvent.theme,
          systemImage: journalEvent.systemImage
        )
      }
    )
    .padding([.horizontal])
    .padding([.vertical], 8)
    .background {
      Rectangle()
        .foregroundColor(journalEvent.theme.backgroundColor)
        .cornerRadius(10)
    }
  }
}
