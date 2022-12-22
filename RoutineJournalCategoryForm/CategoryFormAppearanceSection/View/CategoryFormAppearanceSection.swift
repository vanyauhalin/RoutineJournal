import RoutineJournalColorThemePicker
import RoutineJournalCore
import RoutineJournalIconPicker
import RoutineJournalTimeline
import RoutineJournalUI
import SwiftUI

public struct CategoryFormAppearanceSection: SwiftUI.View {
  public typealias Model = CategoryFormAppearanceSectionModel
  public typealias View = CategoryFormAppearanceSection

  private let model: Model

  public var body: some SwiftUI.View {
    Section(model.sectionTitle) {
      TimelineItemView
        .render(model.previewEvent)
        .listRowSeparator(.hidden)
        .listRowInsets(
          EdgeInsets(
            top: 10,
            leading: 16,
            bottom: 6,
            trailing: 16
          )
        )
        .listRowBackground(
          Rectangle()
            .round([.topLeft, .topRight], radius: 7)
            .foregroundColor(.white)
        )
      ColorThemePicker
        .render()
        .selection(model.selectionColorTheme)
      IconPicker()
        .selection(model.selectionIcon)
        .colorTheme(model.colorTheme)
    }
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }

  public func selection(_ colorTheme: Binding<ColorTheme>) -> View {
    let model = model.reinit(selectionColorTheme: colorTheme)
    return View(model: model)
  }

  public func selection(_ icon: Binding<IconObject>) -> View {
    let model = model.reinit(selectionIcon: icon)
    return View(model: model)
  }
}

struct CategoryFormAppearanceSection_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var colorTheme = ColorTheme.indigo
    @State private var icon = IconObject.default

    var body: some View {
      NavigationView {
        Form {
          CategoryFormAppearanceSection
            .render()
            .selection($colorTheme)
            .selection($icon)
        }
      }
    }
  }

  static var previews: some View {
    PreviewData(self.name) {
      PreviewContainer()
    }
  }
}
