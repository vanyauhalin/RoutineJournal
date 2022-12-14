#if DEBUG
import Combine
import RealmSwift
import RoutineJournalCore
import SwiftUI

public struct PreviewData<Content>: View where Content: View {
  public let content: Content

  public var body: some View {
    ZStack {
      content
      HStack {
        VStack(alignment: .leading) {
          Button("add") {
            try? DataProvider.addExamples()
          }
          Button("delete") {
            try? DataProvider.deleteExamples()
          }
          Spacer()
        }
        Spacer()
      }
      .edgesIgnoringSafeArea(.all)
    }
  }

  public init(_ identifier: String, @ViewBuilder content: () -> Content) {
    DataProvider.useMemory(identifier)
    self.content = content()
  }
}

struct PreviewData_Previews: PreviewProvider {
  class PreviewModel<Object>: ObservableObject where Object: RealmSwift.Object {
    @Published var objects: Results<Object>?
    var objectsCancellable: AnyCancellable?
    var count: Int {
      objects?.count ?? .zero
    }

    init(type: Object.Type) {
      self.objects = try? DataProvider.realm().objects(type)
      self.objectsCancellable = objects?
        .objectWillChange
        .sink { [weak self] _ in
          self?.objectWillChange.send()
        }
    }
  }

  struct PreviewContainer: View {
    let type = CategoryObject.self
    @ObservedObject private var model = PreviewModel(type: CategoryObject.self)

    var body: some View {
      Text("\(type.description()): \(model.count)")
    }
  }

  static var previews: some View {
    PreviewData(self.name) {
      PreviewContainer()
    }
  }
}
#endif
