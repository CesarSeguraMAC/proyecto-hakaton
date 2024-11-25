import UIKit

/*
 Esta clase se encarga de cargar los habitos
 almacenados en la base de datos al view controller
 
 */

class Cargar_habito: UIViewController {
    //esta variable permitira conectarnos a la BD
    private let manager = habito_class();
    
    //Esta variable controla el titulo que se mostrara en la vista
    @IBOutlet weak var Titulo: UILabel!;
    
    //esta variable controla el texto que se muestra en la notita
    @IBOutlet weak var Descripcion: UITextView!
    
    
    //esta variable muestra la imagen que se visualiza en la nota
    @IBOutlet weak var Imagen: UIImageView!
    
    //esta variable recibe el id que es enviado por la clase Habitos, este id se encargara de indicar a que elemento de la base de datos Habitos_DB se esta accediendo
    var id : Int16 = 0;
    
    //estas variables globales se utilizan para recibir los valores recuperados de la BD
    var titulo : String = "";
    var descripcion : String = "";
    var imagen : String = "";
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();

        
        Ingresar_Datos();
        Buscar_habito();//busca el habito que se mostrara en la vista
        
        
        Descripcion.isEditable = false;//evita que el recuadro de texto sea editable
        Descripcion.isSelectable = false;//evita que podamos seleccionar el texto almacenado en el recuadro de texto
        Titulo.text=titulo;//asigna el titulo de la vista
        Descripcion.text=descripcion;//asigna el texto que se mostrara en la nota
        Imagen.image = UIImage(named: imagen);
        //asigna la imagen que se mostrara en la vista
    }
    
    func Ingresar_Datos(){
     /*
      manager.Crear_habito(id: 1, im_name: "vaso de agua", titulo: "Beba suficiente agua ", descripcion: "Su cuerpo está compuesto por aproximadamente un 60% de agua,. Beber suficiente agua ayuda a mantener el equilibrio de los fluidos corporales.");
      
      manager.Crear_habito(id: 2, im_name: "fruta", titulo: "Comer Frutas", descripcion: "La fruta es una de las cosas más importantes para comer todos los días y es parte de una dieta bien balanceada y saludable. Brinda a las personas los nutrientes saludables necesarios para estimular la función corporal durante el día.");
      
      manager.Crear_habito(id: 3, im_name: "dulce", titulo: "Reducir Azucar", descripcion: "Ingerir demasiada azúcar añadida se ha relacionado con resultados adversos, como obesidad, enfermedades cardiovasculares diabetes tipo 2, etc. Las Pautas dietéticas para estadounidenses recomiendan que las personas limiten su consumo de azúcar añadida a menos del 10% de sus calorías totales.");
      
      
      
      manager.Crear_habito(id: 4, im_name: "estiramiento", titulo: "Estiramiento", descripcion: "Hacer que tu cuerpo se mueva durante al menos 10 minutos libera GABA, un neurotransmisor que hace que tu cerebro se sienta calmado y te mantiene en control de tus impulsos.");
      
      
      manager.Crear_habito(id: 5, im_name: "ejercicio", titulo: "Hacer ejercicio", descripcion: "Las actividades de alta energía te ayudan a sentirte mejor fsica y mentalmente. Solo asegúrese de consultar con su médico antes de comenzar cualquier entrenamiento de alta intensidad.");
      
      manager.Crear_habito(id: 6, im_name: "libro", titulo: "Leer un libro", descripcion: "La lectura ayuda mucho a desarrollar su confianza, reduce el estrés y lo pone de mejor humor.");
      
      manager.Crear_habito(id: 7, im_name: "siesta", titulo: "Toma una siesta", descripcion: "La mayoría de los adultos necesitan unas 7 u 8 horas de sueño cada noche Dormir lo suficiente es bueno para la salud, la función cerebral y el bienestar emocional.Es bueno acostarse y levantarse a la misma hora todos los días, incluidos los fines de semana, El cuerpo tiene un reloj interno y hormonas que controlan el sueño y la vigilia. Este reloj funciona mejor si hay una rutina de sueño regular");
      
      manager.Crear_habito(id: 8, im_name: "yoga", titulo: "Yoga", descripcion: "A menudo se considera que el yoga es el estandar de oro en el ejercicio para aliviar el estrés o la ansiedad. Conecta las partes mental y física de ti mismo para un gran beneficio para el cuerpo y la mente");
      
      manager.Crear_habito(id: 9, im_name: "luna", titulo: "Apaga la pantalla", descripcion: "Apague los dispositivos electrónicos al menos 30 minutos antes de acostarse. Esto ayuda a reducir el estrés y la ansiedad, asi como conciliar el sueño de forma rapida.");
      
      
      
      manager.Crear_habito(id: 10, im_name: "despertar", titulo: "Despertarte Temprano", descripcion: "Cuando te levantas temprano, tienes una sensación de orden en la vida, lo que te hace sentir más feliz.");
      */
    }
    
    
    
    func Buscar_habito(){
        let habitoEncontrado = manager.Buscar_habito(id: id);//busca el habito utilizando el id

        if let habito = habitoEncontrado {
            // Si se encontró un hábito, accede a sus propiedades
            
            titulo = habito.titulo!;//recupera el titulo almacenado en la BD
             
            descripcion = habito.descripcion!;//recupera el abito almacenado en la BD
            
             imagen = habito.im_name!;//recupera el nombre de la imagen

            // Ahora puedes utilizar estas variables para lo que necesites
            
            print("El título del hábito es: \(titulo)");
            print("La descripción del hábito es: \(descripcion)");
            print("nombre imagen: \(imagen)")
        } else {
            print("No se encontró ningún hábito con el ID 1")
        }
        
    }//llave final de buscar habito

   
}//llave final de la clase
