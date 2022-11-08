import SwiftUI

public struct JEventView: View {
  let viewModel: JEventViewModel

  public var body: some View {
    JEventContainerView(backgroundColor: viewModel.backgroundColor) {
      JEventLabelView(
        title: {
          VStack(alignment: .leading, spacing: .zero) {
            JEventTitleView(
              title: viewModel.event.title,
              foregroundColor: viewModel.titleForegroundColor
            )
            if let notes = viewModel.event.notes {
              JEventNotesPreview(
                notes: notes,
                foregroundColor: viewModel.notesForegroundColor
              )
            }
          }
          Spacer(minLength: 8)
          VStack(alignment: .trailing, spacing: .zero) {
            JEventTimeView(
              date: viewModel.event.startDate,
              foregroundColor: viewModel.startDateForegroundColor
            )
            if let endDate = viewModel.event.endDate {
              JEventTimeView(
                date: endDate,
                foregroundColor: viewModel.endDateForegroundColor
              )
            } else {
              Spacer()
            }
          }
        },
        icon: {
          JEventIconView(
            icon: viewModel.event.category.icon,
            foregroundColor: viewModel.iconForegroundColor,
            backgroundColor: viewModel.iconBackgroundColor
          )
        }
      )
    }
  }
}
