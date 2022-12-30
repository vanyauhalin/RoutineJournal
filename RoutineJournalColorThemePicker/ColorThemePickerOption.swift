import RoutineJournalMVI
import SwiftUI

public struct ColorThemePickerOption: MVView {
  public typealias Model = ColorThemePickerOptionModel

  @ScaledMetric
  private var scale = 1

  @Environment(\.navigationPickerOptionPosition)
  private var optionPosition

  public var model: Model

  public var spacing: Double {
    switch optionPosition {
      case .destination:
        return Model.destinationSpacing * scale
      case .label:
        return Model.labelSpacing * scale
    }
  }

  public var body: some View {
    HStack(spacing: spacing) {
      ColorThemePickerDecorator()
        .colorTheme(model.colorTheme)
      Text(model.colorTheme.name)
    }
  }

  public init() {
    self.model = Model()
  }
}

struct ColorThemePickerOption_Previews: PreviewProvider {
  static var previews: some View {
    List {
      ColorThemePickerOption()
        .colorTheme(.indigo)
      ColorThemePickerOption()
        .colorTheme(.indigo)
        .environment(\.navigationPickerOptionPosition, .label)
    }
  }
}
