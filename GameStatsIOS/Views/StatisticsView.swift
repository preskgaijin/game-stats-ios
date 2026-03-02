import SwiftUI

struct StatisticsView: View {
    let teamName: String
    let playerStatistics: [String: Int] // Dictionary to hold player names and their statistics

    var body: some View {
        VStack {
            Text("Statistics for \(teamName)")
                .font(.largeTitle)
                .padding()

            List { 
                ForEach(playerStatistics.sorted(by: { $0.value > $1.value }), id: \ .key) { player, stats in
                    HStack {
                        Text(player)
                        Spacer()
                        Text("Score: \(stats)")
                    }
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(teamName: "Warriors", playerStatistics: ["Player 1": 15, "Player 2": 12])
    }
}