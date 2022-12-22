import RoutineJournalColorThemeModifier
import Combine
import RealmSwift
import RoutineJournalCore
import SwiftUI

public final class IconPickerOptionsModel:
  ObservableObject,
  ColorThemeModifierModel
{
  public typealias Model = IconPickerOptionsModel

  public static let width: Double = 28
  public static let spacing: Double = 8

  private var subscriptions = Set<AnyCancellable>()

  @Published
  public var icons: Results<IconObject>?
  public let iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme
  public let query: Binding<String>

  public var collections: [(String, Results<IconObject>)] {
    guard let icons else { return [] }
    return IconCollection
      .allCases
      .map { collection in
        (
          collection.rawValue,
          icons.where { icon in
            icon.collection == collection
          }
        )
      }
      .filter { _, icons in
        !icons.isEmpty
      }
  }

  public init() {
    self.icons = IconObject.objects()
    self.iconSelection = .constant(.default)
    self.colorTheme = .default
    self.query = .constant(.default)
    self.subscribe()
  }

  public init(
    iconSelection: Binding<IconObject> = .constant(.default),
    colorTheme: ColorTheme = .default,
    query: Binding<String> = .constant(.default)
  ) {
    self.icons = IconObject.objects()
    self.iconSelection = iconSelection
    self.colorTheme = colorTheme
    self.query = query
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
    iconSelection: Binding<IconObject>? = nil,
    colorTheme: ColorTheme? = nil,
    query: Binding<String>? = nil
  ) -> Model {
    Model(
      iconSelection: iconSelection ?? self.iconSelection,
      colorTheme: colorTheme ?? self.colorTheme,
      query: query ?? self.query
    )
  }
}
