import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import RoutineJournalQueryModifier
import RoutineJournalSelectModifier
import RoutineJournalUI
import SwiftUI

public struct IconPickerOptions:
  MVIIconSelectionModifier,
  MVIColorThemeModifier,
  MVIQueryModifier,
  MVISelectModifier
{
  public typealias Intent = IconPickerOptionsIntent
  public typealias Model = IconPickerOptionsModel

  @ScaledMetric
  private var scale = 1

  @ObservedObject
  public var model: Model
  public var intent: Intent

  public var width: Double {
    Model.width * scale
  }
  public var spacing: Double {
    Model.spacing * scale
  }
  public var columns: [GridItem] {
    [GridItem(.adaptive(minimum: width), spacing: spacing)]
  }

  public var body: some View {
    List {
      ForEach(model.collections, id: \.self.0) { title, icons in
        Section(title) {
          LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(icons) { icon in
              IconPickerOption()
                .icon(icon)
                .selection(model.iconSelection)
                .colorTheme(model.colorTheme)
                .onSelect {
                  intent.onSelect()
                }
            }
          }
        }
      }
    }
    .listStyle(.plain)
  }

  public init() {
    let model = Model()
    let intent = Intent(model: model)
    self.model = model
    self.intent = intent
  }
}

struct IconPickerOptions_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State
    private var icon = IconObject.default
    @State
    private var query = String.default

    var body: some View {
      PreviewBinding($icon) {
        PreviewBinding($query, position: (.bottom, .trailing)) {
          PreviewSheet { toggle in
            IconPickerOptions()
              .selection($icon)
              .colorTheme(.indigo)
              .query($query)
              .onSelect {
                toggle()
              }
          }
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
