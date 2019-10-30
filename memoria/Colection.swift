
import UIKit

var array_seleccion : [UIImage] = []

class Colection: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var instrucciones: UILabel!
    @IBOutlet weak var use_feedback: UILabel!
    @IBOutlet weak var numero_aciertos: UILabel!
    @IBOutlet weak var collection_view: UICollectionView!
    var contador_text : String = "elige la imagen numero "
    var aciertos_text : String = "/9 Aciertos"
    var aciertos : Int = 0
    var contador : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection_view.dataSource = self
        collection_view.delegate = self
        contador = 0
        aciertos = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return img_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! imgcell

        celda.img_to_show.image = img_array[indexPath.row]
        return celda
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)  {
     
        let celda = collectionView.cellForItem(at: indexPath)! as! imgcell
        
        var aciertos_numero_a_texto = String(aciertos)
        array_seleccion.append(celda.img_to_show.image!)
        
            if shufled_array[contador] == array_seleccion[contador] {
                
                aciertos += 1
                use_feedback.text = "correcto"
                
            }else{
                 use_feedback.text = "incorrecto"
                 }
        
        contador += contador
        var contador_numero_text = String(contador + 1)
        instrucciones.self.text = contador_text + contador_numero_text
        numero_aciertos.self.text = aciertos_numero_a_texto + aciertos_text
        
    }
    
}
