import SwiftUI

struct HomeStatsView : View {
    @EnvironmentObject private var vm : HomeViewModel
    @Binding var showportfolio: Bool
        var body: some View {
            HStack{
                ForEach(vm.statstics){
                    stat in
                    StatisticView(stat:stat).frame(width: UIScreen.main.bounds.width / 3)
                }
            }.frame(width: UIScreen.main.bounds.width, alignment: showportfolio ? .leading : .trailing)
    }
}
struct HomeStatsView_Previews : PreviewProvider {
    static var previews : some View {
        HomeStatsView(showportfolio: .constant(false))
            .environmentObject(dev.HomeVm)
    }
}
