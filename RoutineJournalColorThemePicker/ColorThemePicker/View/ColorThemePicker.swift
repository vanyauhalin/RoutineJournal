import RoutineJournalColorThemeSelectionModifier
import RoutineJournalCore
import RoutineJournalUI
import SwiftUI

public struct ColorThemePicker: SwiftUI.View, MVColorThemeSelectionModifier {
  public typealias Model = ColorThemePickerModel
  public typealias View = ColorThemePicker

  public var model: Model

  public var body: some SwiftUI.View {
    NavigationPicker(model.title, selection: model.colorThemeSelection) {
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

  public init(model: Model) {
    self.model = model
  }

  public static func render() -> View {
    let model = Model()
    return View(model: model)
  }
}

struct ColorThemePicker_Previews: PreviewProvider {
  struct PreviewContainer: View {
    @State private var colorTheme = ColorTheme.indigo

    var body: some View {
      NavigationView {
        Form {
          ColorThemePicker
            .render()
            .selection($colorTheme)
        }
      }
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
