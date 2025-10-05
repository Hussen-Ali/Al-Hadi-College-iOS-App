import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://port.huc.edu.iq/this%20is%20random%20link%20hosin/HUC%20Website/latest%20news")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[APIResponse], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode([APIResponse].self, from: data) 
                      completion(.success(apiResponse))
                  } catch {
                      completion(.failure(error))
                  }
            }
        }
        task.resume()
    }
}


struct APIResponse: Codable {
    let default_img: String
    let title: String
    let date: String
    let details: String

}
