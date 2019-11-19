
import UIKit

// variables globales usadas en las dos pantallas
var img_array : [UIImage] = []
var shufled_array : [UIImage] = []

class ViewController: UIViewController {
    
var contador_img : Int = 0
@IBOutlet weak var img_to_show: UIImageView!
@IBOutlet weak var Start_button: UIButton!
@IBOutlet weak var contador: UILabel!
    
/*
     al cargar la primera pantalla se seleciona las imagenes con las que se va a jugar y se les alateoriza
     y se establece el contador
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        random_img_array()
        shufled_array = img_array.shuffled()
        contador.text = ("  0 de  9 ")
        contador_img = 0
    }
/*
     Selecciona el array de imagenes a utilizar
     */
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
    /* cuando carga la vista se hace visible el boton de comenzar y  resetea el juego con un nuevo array y nuevo orden
    aleatorio
    */
    override func viewDidAppear(_ animated: Bool) {
        contador_img = 0
        Start_button.isHidden = false
        random_img_array()
        shufled_array = img_array.shuffled()
    }
    
    /*
     funcion del boton START inica el juego:
     -esconde el boton de start
     -asigan los textos que se muestran en pantalla
     - inicia el contador en segundos
     -controla la primera parte del juego
     */
    @IBAction func Start(_ sender: Any)
    {
        Start_button.isHidden = true
        var contador_img_text : String = "0"
        let total_text : String =  " de 9 "
    
    Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block:
        { timer in
            if self.contador_img <= 8
            {
                contador_img_text = String(self.contador_img+1)
                // muestra la imagen
                self.img_to_show.image = shufled_array[self.contador_img]
                //muestra al contador por cual imagen va
                self.contador.text = (contador_img_text + total_text)
                self.contador_img+=1
                
            }else
            {// detiene el timer y pasa a la siguiente pantalla
            timer.invalidate()
            self.performSegue(withIdentifier: "test", sender: nil)
            }
        })
    }
}

