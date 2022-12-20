import Combine
import RealmSwift
import RoutineJournalCore
import SwiftUI

public final class IconPickerOptionsModel: ObservableObject {
  public typealias Model = IconPickerOptionsModel

  private var subscriptions = Set<AnyCancellable>()

  @Published public var icons: Results<IconObject>?
  public let selectionIcon: Binding<IconObject>
  public let colorTheme: ColorTheme
  public let query: Binding<String>
  public let size: Size

  public var collections: [(String, Results<IconObject>?)] {
    IconCollection.allCases.map { collection in
      (
        collection.rawValue,
        icons?.where { icon in
          icon.collection == collection
        }
      )
    }
  }

  public init(
    selectionIcon: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default,
    query: Binding<String> = .constant(.default),
    size: Size = .default
  ) {
    self.icons = IconObject.objects()
    self.selectionIcon = selectionIcon
    self.query = query
    self.colorTheme = colorTheme
    self.size = size
    self.subscribe()
  }

  private func subscribe() {
    icons?
      .objectWillChange
      .sink { [weak self] _ in
        self?.objectWillChange.send()
      }
      .store(in: &subscriptions)
  }

  public func reinit(
    selectionIcon: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil,
    query: Binding<String>? = nil,
    size: Size? = nil
  ) -> Model {
    Model(
      selectionIcon: selectionIcon ?? self.selectionIcon,
      colorTheme: colorTheme ?? self.colorTheme,
      query: query ?? self.query,
      size: size ?? self.size
    )
  }
}
