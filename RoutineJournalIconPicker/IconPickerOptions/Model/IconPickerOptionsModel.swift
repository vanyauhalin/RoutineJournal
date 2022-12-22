import Combine
import RealmSwift
import RoutineJournalColorThemeModifier
import RoutineJournalCore
import RoutineJournalIconSelectionModifier
import RoutineJournalQueryModifier
import RoutineJournalSelectModifier
import SwiftUI

public final class IconPickerOptionsModel:
  ObservableObject,
  MVIIconSelectionModifierModel,
  MVIColorThemeModifierModel,
  MVIQueryModifierModel,
  MVISelectModifierModel
{
  public static let width: Double = 28
  public static let spacing: Double = 8

  private var subscriptions = Set<AnyCancellable>()

  @Published
  public var icons: Results<IconObject>?
  public var iconSelection: Binding<IconObject>
  public var colorTheme: ColorTheme
  public var query: Binding<String>

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

  private func subscribe() {
    icons?
      .objectWillChange
      .sink { [weak self] _ in
        self?.objectWillChange.send()
      }
      .store(in: &subscriptions)
  }
}
