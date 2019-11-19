
import UIKit

var array_seleccion : [UIImage] = []

class Colection: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate
{
    
    //declarion de los diferentes textos la vista de galeria y el boton a utilizar
    @IBOutlet weak var instrucciones: UILabel!
    @IBOutlet weak var use_feedback: UILabel!
    @IBOutlet weak var numero_aciertos: UILabel!
    @IBOutlet weak var collection_view: UICollectionView!
    @IBOutlet weak var boton_volver: UIButton!
    
    var contador_text : String = "elige la imagen numero"
    var aciertos_text : String = " /9 Aciertos"
    var aciertos : Int = 0
    var contador : Int = 0
    
    /*
     resetea el valor de los aciertos del jugador y el contador de intentos.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        collection_view.dataSource = self
        collection_view.delegate = self
        contador = 0
        aciertos = 0
    }
    /*
     vuelve a la pantalla inicial
     */
    @IBAction func volver_pantalla1(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
    }
    /*
     devuelve el numero de items que abra en colection view
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return img_array.count
    }
    
    /*
     muestra la imagen en la celda corespondiente
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! imgcell

        celda.img_to_show.image = img_array[indexPath.row]
        
        return celda
        
    }
    /*
     metodo que usa la seleccion del usuario para comparar la imagen seleccionada con el array antiguo.
     */
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)  {
     
        let celda = collectionView.cellForItem(at: indexPath)! as! imgcell
        
        array_seleccion.append(celda.img_to_show.image!)
        
        // solo permite comparar durante nueve intentos
        if contador < 9
        {
            if shufled_array[contador] == array_seleccion[contador] {
                
                aciertos += 1
                use_feedback.text = "correcto"
                celda.img_to_show.isHidden = true
            }else{
                 use_feedback.text = "incorrecto"
                 }
        
        contador += 1
        
        let contador_numero_text = String(contador + 1)
            
        instrucciones.self.text = contador_text + contador_numero_text
            
        let aciertos_numero_a_texto = String(aciertos)
            
        numero_aciertos.self.text = aciertos_numero_a_texto + aciertos_text
        } else
        {
            instrucciones.self.text = ("el juego ha terminado")
            result(aciertos: aciertos)
        
        }
    }
    /*
     Le dice al jugador su resultado dependiendo de su puntuacion
     */
    func result(aciertos : Int){
        if aciertos<=3
        {
            use_feedback.text = ("mala memoria")
            use_feedback.textColor  = UIColor.red
        }
        if aciertos>3 && aciertos<8
        {
            use_feedback.text = ("memoria normal")
            use_feedback.textColor = UIColor.yellow
        }
        if aciertos>7
        {
            use_feedback.text = ("buena memoria!!!")
            use_feedback.textColor  = UIColor.green
        }
        
    }
    
}
