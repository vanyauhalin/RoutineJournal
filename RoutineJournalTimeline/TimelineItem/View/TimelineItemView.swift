import RoutineJournalCore
import RoutineJournalIcon
import RoutineJournalUI
import SwiftUI

public struct TimelineItemView: SwiftUI.View {
  public typealias Model = TimelineItemModel
  public typealias View = TimelineItemView

  private let model: Model

  public var body: some SwiftUI.View {
    TimelineItemContainerView
      .render {
        HStackLabel(
          title: {
            HStack(spacing: .zero) {
              VStack(alignment: .leading, spacing: .zero) {
                TimelineItemTitleView
                  .render(model.object.title)
                  .colorTheme(model.colorTheme)
                if !model.object.notes.isEmpty {
                  TimelineItemNotesView
                    .render(model.object.notes)
                    .colorTheme(model.colorTheme)
                }
              }
              Spacer(minLength: 8)
              VStack(alignment: .trailing, spacing: .zero) {
                TimelineItemDateView<TimelineItemStartDateModel>
                  .render(model.object.startDate)
                  .colorTheme(model.colorTheme)
                TimelineItemDateView<TimelineItemEndDateModel>
                  .render(model.object.endDate)
                  .colorTheme(model.colorTheme)
              }
            }
          },
          icon: {
            if let icon = model.object.category?.icon {
              IconView
                .render(icon)
                .colorTheme(model.colorTheme)
            }
          }
        )
      }
      .colorTheme(model.colorTheme)
  }

  public init(model: TimelineItemModel) {
    self.model = model
  }

  public static func render(_ object: EventObject) -> View {
    let model = Model(from: object)
    return View(model: model)
  }
}

struct TimelineItemView_Previews: PreviewProvider {
  static var previews: some View {
    TimelineItemView
      .render(
        EventObject(
          category: CategoryObject(
            title: "Category Title",
            icon: IconObject(
              name: .airplane,
              type: .system
            ),
            colorTheme: .indigo
          ),
          title: "Event Title",
          notes: "Event notes",
          startDate: Date.now,
          endDate: Date.now
        )
      )
  }
}
