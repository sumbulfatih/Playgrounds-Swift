
import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self                                                //search tabel için gereken prosödür.
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getCurrency(currency: searchBar.text!)                                  //aşağıda tanımladığımız fonksiyonu yazdıktan sonra getiriyoruz  sonra çağırıyoruz
        searchBar.text = ""                                                    //yazdıktan sonra tekrar yazmak için boşaltıyoruz.
    }
    func getCurrency(currency: String) {  //currency bir string değer tanımladık çünkü yukarda cağıra bilmek için
        let url = URL(string: "http://api.fixer.io/latest?base=\(currency)")         //aldğımız apiyi url denilen değişkene atılıyor
        let session = URLSession.shared    //session uygulanıyor
        let task = session.dataTask(with: url!) { (data, response, error) in       //api için gereken durumları giriyoruz. // url gelirse yapılması gerekenler.
            if error != nil {  //error verdiğinde hata vermesi gereken durum
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {   //api data nın getirilmesi için gerekenler
                    do {
                        let jSONResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
                        DispatchQueue.main.async {  //arka planda aynı anda çalışıp sistemi bekletmesin diye asekron ediyoruz
                            print(jSONResult)  //json bilgilerini getiriyoruz
                            let rates = jSONResult["rates"] as! [String : AnyObject]   //json bilgilerinden rates dizilerini alıyoruz
                            let usd = String(describing: rates["USD"]!)   //rates ın içinden USD bilgisini alıyoruz
                            self.usdLabel.text = "USD: \(usd)"             // usd bilgisi labele yazılıyor.
                            
                            let cad = String(describing: rates["CAD"]!)
                            self.cadLabel.text = "CAD: \(cad)"
                            
                            let chf = String(describing: rates["CHF"]!)
                            self.chfLabel.text = "CHF: \(chf)"
                            
                        }
                        
                    } catch {
                        
                    }
                    
                    
                    
                }
                
            }
            
        }
        task.resume()
        
    }

    

}

