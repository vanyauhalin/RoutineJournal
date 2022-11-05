@testable import RoutineJournalJCategory
import RoutineJournalUI
import XCTest

class JCategoryTests: XCTestCase {
  func test_updateTitle() {
    let category = JCategory(
      title: "Title",
      colorTheme: .amber,
      icon: .airplane
    )
    category.update(title: "New Title")
    XCTAssertEqual(
      category.title,
      "New Title",
      "Title hasn't been updated"
    )
  }

  func test_selectColorTheme() {
    let category = JCategory(
      title: "Title",
      colorTheme: .amber,
      icon: .airplane
    )
    category.select(colorTheme: .blue)
    XCTAssertEqual(
      category.colorTheme.name,
      ColorThemeName.blue.rawValue,
      "Color theme hasn't been selected"
    )
  }

  func test_selectIcon() {
    let category = JCategory(
      title: "Title",
      colorTheme: .amber,
      icon: .airplane
    )
    category.select(icon: .cart)
    XCTAssertEqual(
      category.icon.name,
      IconName.cart.rawValue,
      "Icon hasn't been selected"
    )
  }
}
