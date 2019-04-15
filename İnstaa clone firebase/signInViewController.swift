import UIKit
import Firebase
import FirebaseAuth
class signInViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
        override func viewDidLoad() {
        super.viewDidLoad()
}

   
    
    @IBAction func singInClickted(_ sender: Any) {
        if nameText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: nameText.text! , password: passwordText.text! , completion: { (User, Error) in
            
            if Error != nil {
                let alert = UIAlertController(title: "Error", message: Error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else{
                
              UserDefaults.standard.set(User!.email, forKey: "User")
                UserDefaults.standard.synchronize()
                
                let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                
                
                delegate.remmeberLogin()
        }
            })
        }else {
                let alert = UIAlertController(title: "Error", message: "kullancı adı ve şifre gerekli", preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            
                }
             
        }
        
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if nameText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: nameText.text! , password: passwordText.text! , completion: { (User, Error) in
                if Error != nil {
                    let alert = UIAlertController(title: "Error", message: Error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                    
                }else {
                    
                    UserDefaults.standard.set(User!.email, forKey: "User")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                   delegate.remmeberLogin()
                    
                }
                
            })
        }else {
            let alert = UIAlertController(title: "Error", message: "kullancı adı ve şifre gerekli", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
      
    }
    

}
