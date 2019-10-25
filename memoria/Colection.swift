
import UIKit



class Colection: UIViewController,UICollectionViewDataSource
{
      
    @IBOutlet weak var collection_view: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection_view.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return img_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! imgcell

        celda.img_to_show.image = img_array[indexPath.row]
        return celda    }
    
    
}
