import SwiftUI

public struct TimelineJEventView: View {
  public let viewModel: TimelineJEventViewModel

  public var body: some View {
    TimelineItemContainerView(backgroundColor: viewModel.backgroundColor) {
      Label(
        title: {
          HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
              TimelineItemTitleView(
                title: viewModel.event.title,
                foregroundColor: viewModel.titleForegroundColor
              )
              if let notes = viewModel.event.notes {
                TimelineItemNotesPreview(
                  notes: notes,
                  foregroundColor: viewModel.notesForegroundColor
                )
              }
            }
            Spacer(minLength: 8)
            VStack(alignment: .trailing, spacing: .zero) {
              TimelineItemTimeView(
                date: viewModel.event.startDate,
                foregroundColor: viewModel.startDateForegroundColor
              )
              if let endDate = viewModel.event.endDate {
                TimelineItemTimeView(
                  date: endDate,
                  foregroundColor: viewModel.endDateForegroundColor
                )
              } else {
                Spacer()
              }
            }
          }
        },
        icon: {
          if
            let category = viewModel.event.category,
            let icon = category.icon
          {
            TimelineItemIconView(
              icon: icon,
              foregroundColor: viewModel.iconForegroundColor,
              backgroundColor: viewModel.iconBackgroundColor
            )
          }
        }
      )
    }
  }

  public init(viewModel: TimelineJEventViewModel) {
    self.viewModel = viewModel
  }
}
