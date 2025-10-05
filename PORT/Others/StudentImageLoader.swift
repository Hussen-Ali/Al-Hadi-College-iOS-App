import UIKit

class ImageLoader {
    static func loadStudentImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else {
                print("No image data received")
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
    }
}
