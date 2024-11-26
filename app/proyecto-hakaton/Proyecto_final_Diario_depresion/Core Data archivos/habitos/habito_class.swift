
import Foundation;
import CoreData;


class habito_class {
    
    private let container : NSPersistentContainer!;
    
    init(){
        print("en init");
        container = NSPersistentContainer(name: "Habitos_DB")
        print("despues container");
        setupDatabase();
    }
    
    
    private func setupDatabase() {
        print("en setup");
        
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) — \(error)")
                return
            }
            print("Database ready!")
        }
    }//llave final de setup database
    
    
    func Crear_habito (id : Int16,im_name : String, titulo : String, descripcion : String){
        
        let context = container.viewContext
        let habito = Habito(context:context);
        habito.id = id;
        habito.im_name = im_name;
        habito.titulo = titulo;
        habito.descripcion = descripcion;
        
        do {
            try context.save()
            print("id :" , id);
            print("im_name :" , im_name);
            print("titulo :" , titulo);
            print("descripcion :" , descripcion);
            //completion()
        } catch {
            print("error al registrar datos");
        }
        
    }
    
    
    func Buscar_habito(id: Int16) -> Habito? {
        let fetchRequest: NSFetchRequest<Habito> = Habito.fetchRequest();
        let predicate = NSPredicate(format: "id == %d", id);
        fetchRequest.predicate = predicate

        do {
            let results = try container.viewContext.fetch(fetchRequest)
            return results.first // Devuelve el primer resultado o nil si no hay resultados
        } catch {
            print("Error al buscar hábito: \(error)")
            return nil;
        }
    }
    
    
    
    func deleteAllHabitos() {
           let context = container.viewContext

           // Create a fetch request for all Habito entities
           let fetchRequest: NSFetchRequest<Habito> = Habito.fetchRequest()

           // Execute the fetch request
           do {
               let results = try context.fetch(fetchRequest)

               // Delete each fetched Habito object
               for habito in results {
                   context.delete(habito)
               }

               // Save the changes to the persistent store
               try context.save()
               print("All Habito records deleted successfully.")
           } catch {
               print("Error deleting Habito records: \(error)")
           }
       }
    
}//llave final de la clae habito class
