#if DEBUG
import Combine
import RealmSwift
import RoutineJournalCore
import SwiftUI

public struct PreviewContext<Content>: View where Content: View {
  public let model: Model
  @StateObject
  public var context: Context
  @ViewBuilder
  public let content: (Context) -> Content

  public var body: some View {
    ZStack {
      content(context)
        .if(model.sheetApplied) { view in
          SheetContainer(showing: $context.sheetShowing) {
            view
          }
        }
      Container(model.position) {
        Data(identifier: model.identifier)
          .if(model.dataApplied)
        Sheet(showing: $context.sheetShowing)
          .if(model.sheetApplied)
        Counter(counter: $context.counter)
          .if(model.counterApplied)
        Values(values: model.values)
      }
    }
  }

  public init(content: @escaping (Context) -> Content) {
    self.model = Model()
    self._context = StateObject(wrappedValue: Context())
    self.content = content
  }

  public init(
    model: Model,
    context: Context,
    content: @escaping (Context) -> Content
  ) {
    self.model = model
    self._context = StateObject(wrappedValue: context)
    self.content = content
  }

  public func reinit(model: Model) -> Self {
    Self(model: model, context: context, content: content)
  }

  public func id(_ identifier: String) -> Self {
    let model = model.reinit(identifier: identifier)
    return reinit(model: model)
  }

  public func position(
    _ vertical: VerticalPosition,
    _ horizontal: HorizontalPosition
  ) -> Self {
    let model = model.reinit(position: (vertical, horizontal))
    return reinit(model: model)
  }

  public func data() -> Self {
    let model = model.reinit(modifier: .data)
    return reinit(model: model)
  }

  public func sheet() -> Self {
    let model = model.reinit(modifier: .sheet)
    return reinit(model: model)
  }

  public func counter() -> Self {
    let model = model.reinit(modifier: .counter)
    return reinit(model: model)
  }

  public func value(_ value: String?) -> Self {
    let model = model.reinit(value: value)
    return reinit(model: model)
  }
}

struct PreviewContext_Previews: PreviewProvider {
  class PreviewModel<Object>: ObservableObject where Object: RealmSwift.Object {
    var subscriptions = Set<AnyCancellable>()

    let type: Object.Type
    @Published
    var objects: Results<Object>?

    var count: Int {
      objects?.count ?? .zero
    }

    init(type: Object.Type) {
      self.type = type
      self.objects = try? DataProvider.realm().objects(type)
      self.subscribe()
    }

    func subscribe() {
      objects?
        .objectWillChange
        .sink { [weak self] _ in
          self?.objectWillChange.send()
        }
        .store(in: &subscriptions)
    }
  }

  struct PreviewContainer: View {
    @ObservedObject
    private var model = PreviewModel(type: CategoryObject.self)

    var body: some View {
      PreviewContext { context in
        VStack {
          Button("increment") {
            context.increment()
          }
          Button("decrement") {
            context.decrement()
          }
          Button("dismiss") {
            context.dismiss()
          }
        }
      }
      .id(PreviewContext_Previews.name)
      .position(.top, .leading)
      .data()
      .sheet()
      .counter()
      .value("\(model.count) (\(model.type.description()))")
    }
  }

  static var previews: some View {
    PreviewContainer()
  }
}
#endif
