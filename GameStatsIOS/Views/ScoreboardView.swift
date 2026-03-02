import SwiftUI

struct ScoreboardView: View {
    @State private var teamAScore: Int = 0
    @State private var teamBScore: Int = 0
    @State private var innings: [Int] = Array(repeating: 0, count: 9) // Assuming 9 innings

    var body: some View {
        VStack {
            HStack {
                Text("Team A")
                    .font(.largeTitle)
                Spacer()
                Text("Score: \(teamAScore)")
                    .font(.largeTitle)
            }
            HStack {
                Text("Team B")
                    .font(.largeTitle)
                Spacer()
                Text("Score: \(teamBScore)")
                    .font(.largeTitle)
            }
            Divider()
            Text("Innings Scorecard")
                .font(.headline)
            HStack {
                ForEach(0..<innings.count, id: \.self) { index in
                    Text("Inning \(index + 1): \(innings[index])")
                        .frame(minWidth: 100)
                }
            }
            HStack {
                Button(action: {
                    teamAScore += 1
                }) {
                    Text("Add Run to Team A")
                }
                Button(action: {
                    teamBScore += 1
                }) {
                    Text("Add Run to Team B")
                }
            }
        }
        .padding()
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView()
    }
}