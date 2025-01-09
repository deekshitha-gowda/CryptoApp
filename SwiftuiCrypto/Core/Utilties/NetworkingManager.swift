import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse (url: URL)
        case unknown
        
         var errorDescription: String? {
            switch self {
            case .badURLResponse(url : let url):
                return "Bad URL Response from URL: \(url)"
            case .unknown:
                return "Unknown Error"
            }
        }
    }
    
    static func download (url: URL) -> AnyPublisher<Data, any Error> {
      return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLresponse (output: $0, url:url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion (completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            print("Finished")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
    
    static func handleURLresponse (output : URLSession.DataTaskPublisher.Output, url : URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
}
