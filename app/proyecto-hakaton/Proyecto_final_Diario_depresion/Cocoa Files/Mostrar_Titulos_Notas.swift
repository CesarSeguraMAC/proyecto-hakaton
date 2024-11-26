
import UIKit

class Mostrar_Titulos_Notas: UIViewController {

    var tag_a_enviar : Int = 0;
    
    private let manager =  notitas_class();//instancia clase notitas_class
    
    var todasLasNotas = [Notita]();
    
    @IBOutlet weak var Pila_de_botones: UIStackView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        
        
    }//llave final view did load
    

    func Cargar_botones(){
       
        let miLabel = UILabel();
        miLabel.text = "Notas Disponibles"
        miLabel.textAlignment = .center;

        todasLasNotas = manager.obtenerTodasLasNotas();

        print("antes del if");

        if(todasLasNotas.count == 0){
            miLabel.text="No hay notas disponibles";
            Pila_de_botones.addArrangedSubview(miLabel);
            return;
        }//llave final del if
        print("antes del for");

        Pila_de_botones.addArrangedSubview(miLabel);

        for (index, nota) in todasLasNotas.enumerated() {
            let button = UIButton(type: .system)
            let cadenaConcatenada = "\(nota.titulo!)"
            button.setTitle(cadenaConcatenada, for: .normal)
            button.tag = index
            button.backgroundColor = .systemPink // Fondo rosa
            button.layer.cornerRadius = 10 // Esquinas redondeadas (opcional)
            
            // Aquí agregamos la acción al botón
            button.addTarget(self, action: #selector(botonPresionado(_:)), for: .touchUpInside)
            
            Pila_de_botones.addArrangedSubview(button)
        }
    }//llave final de cargar botones

    
    @objc func botonPresionado(_ sender: UIButton) {
        tag_a_enviar = sender.tag;
        print("Se presionó el botón con tag: \(tag_a_enviar)")
        cambiar_seague();
        // Aquí puedes realizar acciones con el tag, por ejemplo:
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        Cargar_botones();
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        Pila_de_botones.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let notaSeleccionada = todasLasNotas[tag_a_enviar];
        
        
            if segue.identifier == "S2" {
                let destinationVC = segue.destination
                as! Ver_Nota
                destinationVC.Id_nota = notaSeleccionada.id;
            }//llave final del if
        }//llave final de prepare
    
    func cambiar_seague(){
        performSegue(withIdentifier: "S2", sender: self);
    }
    
    
}//llave final de la clase
