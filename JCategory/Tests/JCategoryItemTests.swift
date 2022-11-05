@testable import RoutineJournalJCategory
import RoutineJournalUI
import XCTest

class JCategoryItemTests: XCTestCase {
  func test_updateCategory() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        colorTheme: .amber,
        icon: .airplane
      ),
      title: "Item Title"
    )
    item.update(category: JCategory(
      title: "New Category Title",
      colorTheme: .blue,
      icon: .cart
    ))
    XCTAssertEqual(
      item.category.title,
      "New Category Title",
      "Category title hasn't been updated"
    )
    XCTAssertEqual(
      item.category.colorTheme.name,
      ColorThemeName.blue.rawValue,
      "Category color theme hasn't been updated"
    )
    XCTAssertEqual(
      item.category.icon.name,
      IconName.cart.rawValue,
      "Category icon hasn't been updated"
    )
  }

  func test_updateTitle() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        colorTheme: .amber,
        icon: .airplane
      ),
      title: "Item Title"
    )
    item.update(title: "New Item Title")
    XCTAssertEqual(
      item.title,
      "New Item Title",
      "Title hasn't been updated"
    )
  }

  func test_updateNotes() {
    let item = JCategoryItem(
      category: JCategory(
        title: "Category Title",
        colorTheme: .amber,
        icon: .airplane
      ),
      title: "Item Title"
    )
    item.update(notes: "Item notes")
    XCTAssertEqual(
      item.notes,
      "Item notes",
      "Notes hasn't been updated"
    )
  }
}
