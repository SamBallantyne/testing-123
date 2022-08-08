import SwiftUI

struct HeartbeatMsg : Codable {
    var latestEventId: Int
}

class EventIdProvider : ObservableObject {
    
    let _publishableKey: String
    
    let urlSession = URLSession(configuration: .default)
    
    @Published var eventId : Int? = nil
    @Published var isConnected : Bool = false
    
    private func connect () {
        let url = URL(string: "wss://backend.shanghai.technology?authKey=\(_publishableKey)")!
        let webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask.receive { result in
            switch result {
            case .failure(let error):
                print("Failed to receive message: \(error)")
            case .success(let message):
                switch message {
                case .string(let text):
                    if let msg = try? JSONDecoder().decode(HeartbeatMsg.self, from: Data(text.utf8)) {
                        self.eventId = msg.latestEventId
                    }
                case .data(let data):
                    print("Received unexpected data: \(data)")
                @unknown default:
                    fatalError()
                }                
            }
        }
        webSocketTask.resume()
    }
    
    init(publishableKey: String) {
        _publishableKey = publishableKey
        connect();
    }
}
