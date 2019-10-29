
import UIKit

var array_seleccion : [UIImage] = []
var contador = 0

class Colection: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate
{
      
    @IBOutlet weak var collection_view: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection_view.dataSource = self
        collection_view.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return img_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! imgcell

        celda.img_to_show.image = img_array[indexPath.row]
        return celda    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)  {
        // codigo  para seleccionar
        // extraer index path de la celda seleccionada
        // confirmar  que concide con la clave del array aleatorio
       
        let celda = collectionView.cellForItem(at: indexPath)! as! imgcell
        
        array_seleccion.append(celda.img_to_show.image!)
        
            if shufled_array[contador] == array_seleccion[contador] {
                
                print("correcto")
            }
            contador += contador
        
        
    }
}
