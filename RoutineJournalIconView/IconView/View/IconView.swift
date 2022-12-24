import RoutineJournalMVI
import SwiftUI

public struct IconView: MVView {
  public typealias Model = IconModel

  @ScaledMetric
  private var scale = 1

  public var model: Model

  public var width: Double {
    Model.width * scale
  }
  public var height: Double {
    Model.height * scale
  }
  public var cornerRadius: Double {
    Model.cornerRadius * scale
  }

  public var body: some View {
    Image(systemName: model.systemName)
      .foregroundColor(model.foregroundColor)
      .frame(width: width, height: height)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .foregroundColor(model.backgroundColor)
      )
  }

  public init() {
    self.model = Model()
  }
}

struct IconView_Previews: PreviewProvider {
  static var previews: some View {
    IconView()
      .icon(.default)
      .colorTheme(.indigo)
  }
}
