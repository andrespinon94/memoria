
import UIKit




class ViewController: UIViewController {

    @IBOutlet weak var img_to_show: UIImageView!
    @IBOutlet weak var Start_button: UIButton!
    var img_array : [UIImage] = [#imageLiteral(resourceName: "FL4K"),#imageLiteral(resourceName: "moze"),#imageLiteral(resourceName: "Zane"),#imageLiteral(resourceName: "amara"),#imageLiteral(resourceName: "zero"),#imageLiteral(resourceName: "Gaige"),#imageLiteral(resourceName: "salvador"),#imageLiteral(resourceName: "Maya"),#imageLiteral(resourceName: "Axton")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func Start(_ sender: Any) {
        
        img_to_show.image = img_array[0]
    }
    


}

