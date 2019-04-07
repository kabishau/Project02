import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var country: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = country.uppercased()
        if let country = country {
            imageView.image = UIImage(named: country)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlagTapped))
    }
    
    @objc func shareFlagTapped() {
        var message: String {
            switch country {
            case "us", "uk":
                return "Here is a flag of \(country.uppercased())"
            default:
                return "Here is a flag of \(country.capitalized)"
            }
        }
        
        if let image = UIImage(named: country) {
            let activityViewController = UIActivityViewController(activityItems: [message, image], applicationActivities: [])
            // for iPad
            activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(activityViewController, animated: true, completion: nil)
        }
    }
}
