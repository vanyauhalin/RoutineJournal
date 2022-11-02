import Foundation

class JournalEvent {
  let title: String
  let description: String?
  let systemImage: String
  let startDate: String
  let endDate: String
  let theme: JournalEventTheme

  init(
    title: String,
    description: String?,
    systemImage: String,
    startDate: String,
    endDate: String,
    theme: JournalEventTheme
  ) {
    self.title = title
    self.description = description ?? nil
    self.systemImage = systemImage
    self.startDate = startDate
    self.endDate = endDate
    self.theme = theme
  }
}
