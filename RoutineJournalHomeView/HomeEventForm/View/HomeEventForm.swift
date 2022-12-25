import RoutineJournalEventForm
import RoutineJournalUI
import SwiftUI

public struct HomeEventForm: ToolbarContent {
  public typealias Model = HomeEventFormModel
  public typealias View = HomeEventForm

  @ObservedObject private var model: Model

  public var body: some ToolbarContent {
    ToolbarItem(placement: .bottomBar) {
      Button(
        action: {
          model.showing.toggle()
        },
        label: {
          Image(systemName: model.iconName)
        }
      )
      .sheet(isPresented: $model.showing) {
        EventForm
          .render()
      }
    }
  }

  public init() {
    self.model = Model()
  }
}

struct HomeEventForm_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Text("content")
        .toolbar {
          HomeEventForm()
        }
    }
  }
}
