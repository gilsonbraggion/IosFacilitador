import UIKit

class PerfilController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func direcionarFornecedor(_ sender: UIButton) {
        
        let url = URL(string: "http://viacep.com.br/ws/01001000/json/")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    
                    print(json)
                    
                }catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
        
        
        print("clicou fornecedor")
        
        redirecionar(uiView: "tabBarFornecedor")
        
        print("depois de redirecionar")
    }
    
    
    @IBAction func direcionarContratante(_ sender: UIButton) {
        
        print("clicou Contratante")
        
        redirecionar(uiView: "tabBarContratante")
        
    }
    
    func redirecionar(uiView : String) {
        
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: uiView)
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }

}
