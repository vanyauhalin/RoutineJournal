import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import RoutineJournalUI
import SwiftUI

public struct IconPickerExplorer:
  SwiftUI.View,
  MVIconSelectionModifier,
  MVColorThemeModifier
{
  public typealias Model = IconPickerExplorerModel
  public typealias View = IconPickerExplorer

  @Environment(\.dismiss)
  private var dismiss

  @ObservedObject
  public var model: Model

  public var body: some SwiftUI.View {
    NavigationView {
      IconPickerOptions
        .render()
        .selection(model.iconSelection)
        .colorTheme(model.colorTheme)
        .query($model.query)
        .onSelect {
          dismiss()
        }
        .navigationTitle(Model.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Cancel") {
              dismiss()
            }
          }
        }
    }
    .searchable(
      text: $model.query,
      placement: .navigationBarDrawer(displayMode: .always)
    )
  }

  public init() {
    self.model = Model()
  }

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct IconPickerExplorer_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var icon = IconObject.default

    var body: some View {
      PreviewBinding($icon) {
        PreviewSheet { _ in
          IconPickerExplorer
            .render()
            .selection($icon)
            .colorTheme(.indigo)
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
