
import UIKit

var img_array : [UIImage] = [#imageLiteral(resourceName: "FL4K"),#imageLiteral(resourceName: "moze"),#imageLiteral(resourceName: "Zane"),#imageLiteral(resourceName: "amara"),#imageLiteral(resourceName: "zero"),#imageLiteral(resourceName: "Gaige"),#imageLiteral(resourceName: "salvador"),#imageLiteral(resourceName: "Maya"),#imageLiteral(resourceName: "Axton")]
var shufled_array : [UIImage] = []

class ViewController: UIViewController {

    @IBOutlet weak var img_to_show: UIImageView!
    @IBOutlet weak var Start_button: UIButton!
    @IBOutlet weak var contador: UILabel!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    shufled_array = img_array.shuffled()
        contador.text = ("  0 de  9 ")
        
    }
    
    @IBAction func Start(_ sender: Any) {
        
    var i : Int = 0
    var i_text : String = "0"
    let total_text : String =  " de  9 "
    
    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
    if i <= 8{
    i_text = String(i+1)
    self.img_to_show.image = shufled_array[i]
    self.contador.text = (i_text + total_text)
        i+=1
            
    }else{
        
        self.performSegue(withIdentifier: "test", sender: nil)
        
        }
        })
       
        
        
    }
    


}

