
import UIKit

var img_array : [UIImage] = [#imageLiteral(resourceName: "FL4K"),#imageLiteral(resourceName: "moze"),#imageLiteral(resourceName: "Zane"),#imageLiteral(resourceName: "amara"),#imageLiteral(resourceName: "zero"),#imageLiteral(resourceName: "Gaige"),#imageLiteral(resourceName: "salvador"),#imageLiteral(resourceName: "Maya"),#imageLiteral(resourceName: "Axton")]
var shufled_array : [UIImage] = []
var i : Int = 0
class ViewController: UIViewController {

@IBOutlet weak var img_to_show: UIImageView!
@IBOutlet weak var Start_button: UIButton!
@IBOutlet weak var contador: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shufled_array = img_array.shuffled()
        contador.text = ("  0 de  9 ")
        i = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        i = 0
        Start_button.isHidden = false
    }
    
    @IBAction func Start(_ sender: Any)
    {
        Start_button.isHidden = true
        var i_text : String = "0"
        let total_text : String =  " de 9 "
    
    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block:
        { timer in
            if i <= 8
            {
                i_text = String(i+1)
                self.img_to_show.image = shufled_array[i]
                self.contador.text = (i_text + total_text)
                i+=1
            }else
            {
            timer.invalidate()
            self.performSegue(withIdentifier: "test", sender: nil)
            }
        })
    }
}

