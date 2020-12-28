import UIKit


class CountryDataTableViewController: UITableViewController{
    
    let service = CovidScreenerService()
    
    var summaryData: [Countries] = []
    //var data: [CovidApiResponse] = []
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        service.summary(callback: { summaryData in
            
            // Save data
            self.summaryData = summaryData
            
            // Reload table
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
        // Do any additional setup after loading the tableview
        
    

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summaryData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? TableCell else {
            print("Cell not found")
            return UITableViewCell()
        }
        
        cell.country?.text = String(summaryData[indexPath.row].Country)
        cell.country?.adjustsFontSizeToFitWidth.toggle()
        
        // Format numbers
        numberFormatter.numberStyle = .decimal
        cell.cases?.text = String(numberFormatter.string(from: NSNumber(value: summaryData[indexPath.row].TotalConfirmed))!)
        cell.cases?.textAlignment = .center
        cell.cases?.adjustsFontSizeToFitWidth.toggle()
        
        cell.deaths?.text = String(numberFormatter.string(from: NSNumber(value: summaryData[indexPath.row].TotalDeaths))!)
        cell.deaths?.textAlignment = .center
        cell.deaths?.adjustsFontSizeToFitWidth.toggle()
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Country \t \t \t \t \t \t Cases \t Deaths"
    }
    
}
