

import UIKit

class Ver_Nota: UIViewController {

    var Id_nota : UUID?;
    
    @IBOutlet weak var Titulo_Nota: UILabel!
    
    
    @IBOutlet weak var Texto_Nota: UITextView!
    
    private let manager =  notitas_class();//instancia clase notitas_class
    
    @IBOutlet weak var Cambiar_titulo_box: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let notaEncontrada = manager.obtenerNotaPorID(id: Id_nota!) {
            print(notaEncontrada.titulo!);
            print(notaEncontrada.texto!);
            Titulo_Nota.text = notaEncontrada.titulo!;
            
            Texto_Nota.text = notaEncontrada.texto!;
            
        } else {
            print("La nota no existe")
        }
       
        
    }//llave final del view did load
    
    

   
    @IBAction func Button_ir_a_inicio(_ sender: Any) {
        volver_inicio();
    }
    
    @IBAction func Borrar_la_nota(_ sender: Any) {
        manager.eliminarNota(conID: Id_nota!);
        volver_inicio();
    }//llave final de borrar la nota
    
    func volver_inicio(){
        Editar_la_nota();
        performSegue(withIdentifier: "Ver_nota_a_Inicio", sender: self);

    }
    
    
    func Editar_la_nota(){
        
        if Cambiar_titulo_box.text == ""{
            manager.actualizarNota(conID: Id_nota!, nuevoTitulo: Titulo_Nota.text!, nuevoTexto: Texto_Nota.text!);
        }else{
            manager.actualizarNota(conID: Id_nota!, nuevoTitulo: Cambiar_titulo_box.text!, nuevoTexto: Texto_Nota.text!);
        }//llave final del else
    }//llave final de editar la nota
    
}//llave final de la clase
