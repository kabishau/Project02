import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        print("got there")
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            viewController.country = countries[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

