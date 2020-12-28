import Foundation

// Save a path/url using typealias
//typealias CovidT = type expression


// The Model object - Provides API interface with data source
struct CovidScreenerService{
    
    // Summary() Most qualified call, missing lat/lon however
    func summary(callback: @escaping ([Countries])->Void){

        // Save API endpoint
        guard let url = URL(string: "https://api.covid19api.com/summary") else {
            // Handle error here
            return

        }

        // Make the request
        let task = URLSession.shared.dataTask(with: url) { (maybeData, maybeResponse, maybeError) in
            guard let data = maybeData else {
                // Handle error
                print("Error getting data")
                return
            }
            let decoder = JSONDecoder()
            do{
                print("Decoding JSON...")
                let decoded = try decoder.decode(CovidData.self, from: data)

                callback(decoded.Countries)          
            } catch {
                print("Error decoding JSON")
                // Print error
                print(error)
            }

        }
        task.resume()

    }
    
    
    // [API] Countries() - Get code
    func countries() {
        
    }
    
}
