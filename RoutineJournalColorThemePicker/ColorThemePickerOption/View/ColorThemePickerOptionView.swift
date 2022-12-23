import RoutineJournalColorThemeModifier
import RoutineJournalCore
import SwiftUI

public struct ColorThemePickerOptionView: SwiftUI.View, MVColorThemeModifier {
  public typealias Model = ColorThemePickerOptionModel
  public typealias View = ColorThemePickerOptionView

  @Environment(\.navigationPickerOptionPosition) private var optionPosition
  @ScaledMetric private var scale = 1

  public var model: Model

  public var spacing: Double {
    switch optionPosition {
      case .destination:
        return Model.destinationSpacing
      case .label:
        return Model.labelSpacing
    }
  }

  public var body: some SwiftUI.View {
    HStack(spacing: spacing) {
      ColorThemePickerDecoratorView
        .render()
        .colorTheme(model.colorTheme)
      Text(model.colorTheme.name)
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

struct ColorThemePickerOptionView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      ColorThemePickerOptionView
        .render()
        .colorTheme(.indigo)
      ColorThemePickerOptionView
        .render()
        .colorTheme(.indigo)
        .environment(\.navigationPickerOptionPosition, .label)
    }
  }
}
