
import UIKit

class Habitos: UIViewController {

    var numero : Int16 = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }//llave final de didViewLoad
    
    
    
    @IBAction func Bebe_agua(_ sender: Any) {
        numero=1;
        cambiar_seague();
    }//boton correspondienta a Beber agua
    
    @IBAction func Comer_Frutas(_ sender: Any) {
        numero=2;
        cambiar_seague();
    }//boton correspondienta a Comer Fruta
    
    
    @IBAction func Reducir_la_azucar(_ sender: Any) {
        numero=3;
        cambiar_seague();
    }//boton correspondienta a Reducir Azucar
    
    
    @IBAction func Estiramiento(_ sender: Any) {
        numero=4;
        cambiar_seague();
    }//boton correspondienta a Estiramiento
    
    
    
    @IBAction func Hacer_Ejercicio(_ sender: Any) {
        numero=5;
        cambiar_seague();
    }//boton correspondienta a Hacer ejercicio
    
    @IBAction func Leer_un_libro(_ sender: Any) {
        numero=6;
        cambiar_seague();
    }//boton correspondienta a Leer un Libro
    
    @IBAction func Tomas_una_siesta(_ sender: Any) {
        numero=7;
        cambiar_seague();
    }//boton correspondienta a Tomar una siesta
    
    @IBAction func Yoga(_ sender: Any) {
        numero=8;
        cambiar_seague();
    }
    //boton correspondienta a hacer yoga
    
    @IBAction func Apaga_la_pantalla(_ sender: Any) {
        numero=9;
        cambiar_seague();
    }
    //boton correspondienta a Apagar pantalla
    
    @IBAction func Despertar_temprano(_ sender: Any) {
        numero=10;
        cambiar_seague();
    }//boton correspondienta a despertar agua
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "S1" {
                let destinationVC = segue.destination
                as! Cargar_habito
                destinationVC.id = numero;// Se envia un valor numerico a la vista Cargar Habito
            }//llave final del if
        }//llave final de prepare
    
    //Se indica que se desea cambiar de vista utilizando el seague S1
    func cambiar_seague(){
        performSegue(withIdentifier: "S1", sender: self);
    }
    
}//llave final de la clase
