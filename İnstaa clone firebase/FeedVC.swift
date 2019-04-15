
import UIKit
import Firebase
import FirebaseAuth
class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       }
    
    @IBAction func logoutClicked(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "User")
        UserDefaults.standard.synchronize()
        
       let sigIn = self.storyboard?.instantiateViewController(withIdentifier:"signInViewController") as! signInViewController
        
        let  delegete : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        delegete.window?.rootViewController =  sigIn
        delegete.remmeberLogin()
        
        
        
    }
    

    


}

