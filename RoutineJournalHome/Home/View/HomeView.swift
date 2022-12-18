// swiftlint:disable closure_body_length
import RoutineJournalEventForm
import RoutineJournalTimeline
import RoutineJournalUI
import SwiftUI

public struct HomeView: View {
  @ObservedObject public var model: HomeModel

  public var body: some View {
    NavigationView {
      VStack(spacing: 8) {
        if let objects = model.objects {
          ForEach(objects) { object in
            TimelineItemView
              .render(object)
          }
        }
        Spacer()
      }
      .navigationTitle("Routine")
      .padding([.horizontal])
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Image(systemName: "list.bullet.below.rectangle")
            .opacity(0.1)
          Rectangle()
            .frame(width: 0, height: 0)
            .hidden()
          Image(systemName: "gearshape")
            .opacity(0.1)
        }
        ToolbarItem(placement: .bottomBar) {
          Image(systemName: "tag")
            .opacity(0.1)
        }
        ToolbarItem(placement: .status) {
          Text(model.string)
            .font(.footnote)
        }
        ToolbarItem(placement: .bottomBar) {
          Button(
            action: {
              model.plus.toggle()
            },
            label: {
              Image(systemName: "plus")
            }
          )
        }
      }
      .sheet(isPresented: $model.plus) {
        EventForm
          .render()
      }
    }
  }

  public init(model: HomeModel) {
    self.model = model
  }

  public static func render(_ date: Date) -> HomeView {
    let model = HomeModel(date: date)
    return HomeView(model: model)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewData(self.name) {
      HomeView
        .render(Date.now)
    }
  }
}
