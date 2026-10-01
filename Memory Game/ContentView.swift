import SwiftUI

struct ContentView: View {

    let allSymbols = [
        "🚀", "🟡", "❤️", "⭐️", "🔥",
        "🍎", "⚽️", "🐶", "🌈", "🍕"
    ]

    @State private var numberOfPairs = 10
    @State private var cards: [String] = []
    @State private var flippedCards: Set<Int> = []
    @State private var matchedCards: Set<Int> = []
    @State private var firstSelectedCard: Int?
    @State private var isCheckingMatch = false

    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

    var body: some View {

        VStack(spacing: 15) {

            HStack {

                Menu {

                    Button("3 Pairs") {
                        numberOfPairs = 3
                        resetGame()
                    }

                    Button("6 Pairs") {
                        numberOfPairs = 6
                        resetGame()
                    }

                    Button("10 Pairs") {
                        numberOfPairs = 10
                        resetGame()
                    }

                } label: {

                    Text("Choose Size")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Color.orange)
                        .clipShape(Capsule())
                }

                Spacer()

                Button {
                    resetGame()
                } label: {

                    Text("Reset Game")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 12)
                        .background(Color.green)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)

            ScrollView {

                LazyVGrid(columns: columns, spacing: 8) {

                    ForEach(cards.indices, id: \.self) { index in

                        ZStack {

                            if !matchedCards.contains(index) {

                                RoundedRectangle(cornerRadius: 8)
                                    .fill(
                                        flippedCards.contains(index)
                                        ? Color.white
                                        : Color.blue
                                    )

                                if flippedCards.contains(index) {
                                    Text(cards[index])
                                        .font(.system(size: 45))
                                }
                            }
                        }
                        .frame(height: 150)
                        .overlay {

                            if flippedCards.contains(index)
                                && !matchedCards.contains(index) {

                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 2)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {

                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectCard(index)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
        }
        .padding(.top)
        .onAppear {
            resetGame()
        }
    }

    // MARK: - Card Selection

    func selectCard(_ index: Int) {

        if isCheckingMatch {
            return
        }

        if flippedCards.contains(index) {
            return
        }

        if matchedCards.contains(index) {
            return
        }

        flippedCards.insert(index)

        if let firstIndex = firstSelectedCard {

            isCheckingMatch = true

            if cards[firstIndex] == cards[index] {

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {

                    withAnimation {
                        matchedCards.insert(firstIndex)
                        matchedCards.insert(index)

                        flippedCards.remove(firstIndex)
                        flippedCards.remove(index)
                    }

                    firstSelectedCard = nil
                    isCheckingMatch = false
                }

            } else {

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

                    withAnimation {
                        flippedCards.remove(firstIndex)
                        flippedCards.remove(index)
                    }

                    firstSelectedCard = nil
                    isCheckingMatch = false
                }
            }

        } else {

            firstSelectedCard = index
        }
    }

    // MARK: - Reset Game

    func resetGame() {

        flippedCards.removeAll()
        matchedCards.removeAll()
        firstSelectedCard = nil
        isCheckingMatch = false

        let selectedSymbols =
            Array(allSymbols.prefix(numberOfPairs))

        cards =
            (selectedSymbols + selectedSymbols)
            .shuffled()
    }
}

#Preview {
    ContentView()
}
