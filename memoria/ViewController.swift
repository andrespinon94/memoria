
import UIKit

var img_array : [UIImage] = []
var shufled_array : [UIImage] = []
var i : Int = 0
class ViewController: UIViewController {

@IBOutlet weak var img_to_show: UIImageView!
@IBOutlet weak var Start_button: UIButton!
@IBOutlet weak var contador: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random_img_array()
        shufled_array = img_array.shuffled()
        contador.text = ("  0 de  9 ")
        i = 0
    }
   
    func random_img_array(){

        let random_number = Int.random(in: 0..<4)
        
        switch random_number {
            
        case 1 :
            img_array = [#imageLiteral(resourceName: "FL4K"),#imageLiteral(resourceName: "moze"),#imageLiteral(resourceName: "Zane"),#imageLiteral(resourceName: "amara"),#imageLiteral(resourceName: "zero"),#imageLiteral(resourceName: "Gaige"),#imageLiteral(resourceName: "salvador"),#imageLiteral(resourceName: "Maya"),#imageLiteral(resourceName: "Axton")];
        case 2 :
            img_array = [#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "killerwahale"),#imageLiteral(resourceName: "wasp"),#imageLiteral(resourceName: "capuchino"),#imageLiteral(resourceName: "blue_ring_octo"),#imageLiteral(resourceName: "polar"),#imageLiteral(resourceName: "golden"),#imageLiteral(resourceName: "bush-viper"),#imageLiteral(resourceName: "GUILA-IMPERIAL")];
        case 3 :
            img_array = [#imageLiteral(resourceName: "ugandan_knucles"),#imageLiteral(resourceName: "Confession-Bear"),#imageLiteral(resourceName: "table_Cat"),#imageLiteral(resourceName: "trollface"),#imageLiteral(resourceName: "yaoming"),#imageLiteral(resourceName: "Socially-Awkward-Awesome-Penguin"),#imageLiteral(resourceName: "spiderman"),#imageLiteral(resourceName: "to_be_continued"),#imageLiteral(resourceName: "the_boys")];
        default:
           print("error")
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        i = 0
        Start_button.isHidden = false
        random_img_array()
        shufled_array = img_array.shuffled()
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

