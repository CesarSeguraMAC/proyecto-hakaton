

import UIKit
import Foundation


class Nota: UIViewController {

    private let manager = notitas_class();//instancia clase notitas_class
    
    
    @IBOutlet weak var Titulo: UILabel!
    
    @IBOutlet weak var Ingresar_texto_nota: UITextView!
    
    
    @IBOutlet weak var Ingresar_titulo_Nota: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("en Nota");
    }
    

    @IBAction func Guardar_Nota(_ sender: Any) {
        if(Ingresar_titulo_Nota.text==""){
            Ingresar_titulo_Nota.text="Sin titulo";
        }
        if(Ingresar_texto_nota.text==""){
            Ingresar_texto_nota.text="";
        }
        
        let titulo_nota=Ingresar_titulo_Nota.text!;
        let texto_nota=Ingresar_texto_nota.text!;
        
        
        manager.Crear_Nota(titulo: titulo_nota, texto: texto_nota, fecha: Date());
        Ingresar_texto_nota.text="Ingresa tu nota aqui";
        Ingresar_titulo_Nota.text=nil;
        
        Titulo.text="Notita guardada";
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
                    
                    // Aquí puedes agregar el código que deseas ejecutar
                    // Por ejemplo, actualizar una etiqueta:
                self.Titulo.text="Crear Notita";
                }//llave final
    }
    
    
    @IBAction func Limpiar_Nota(_ sender: Any) {
        Ingresar_texto_nota.text="Ingresa tu nota aqui";
        Ingresar_titulo_Nota.text=nil;
        Titulo.text="Notita nueva";
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
                    
                    // Aquí puedes agregar el código que deseas ejecutar
                    // Por ejemplo, actualizar una etiqueta:
                self.Titulo.text="Crear Notita";
                }//llave final
        
    }//llave final de limpiar nota
    
    
    
    
}//llave final de la clase
