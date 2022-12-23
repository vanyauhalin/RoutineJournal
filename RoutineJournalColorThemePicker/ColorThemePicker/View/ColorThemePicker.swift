import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public struct ColorThemePicker: MVColorThemeSelectionModifier {
  public typealias Model = ColorThemePickerModel

  public var model: Model

  public var body: some View {
    NavigationPicker(Model.title, selection: model.colorThemeSelection) {
      ColorTheme.allCases.map { colorTheme in
        NavigationPicker.Option(id: colorTheme) {
          ColorThemePickerOptionView
            .render()
            .colorTheme(colorTheme)
        }
      }
    }
  }

  public init() {
    self.model = Model()
  }
}

struct ColorThemePicker_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var colorTheme = ColorTheme.indigo

    var body: some View {
      NavigationView {
        Form {
          ColorThemePicker()
            .selection($colorTheme)
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
