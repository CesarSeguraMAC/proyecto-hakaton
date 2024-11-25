import Foundation;
import CoreData;


class notitas_class{//llave inicial de la clase
    private let container : NSPersistentContainer!;
    
    init(){//metodo constructor
        
        container = NSPersistentContainer(name: "Notitas_BD");
        
        setupDatabase();// se prepara la base de datos
    }//llave final del constructor
    
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
    
    
    func Crear_Nota(titulo : String, texto : String, fecha : Date){
        
        let context = container.viewContext;
        let notita = Notita(context: context);
        notita.titulo = titulo;// se almacena el titulo de la nota
        notita.texto = texto;// se almacena el texto de la nota
        notita.fecha = fecha;//se almacena la fecha de la nota
        notita.id = UUID();//se crea un UUID automaticamente
        
        do {
            try context.save()
            print("datos guardados");
            //completion()
        } catch {
            print("error al registrar datos");
        }//llave final del catch
    }//llave final del metodo crear nota
    
    func obtenerTodasLasNotas() -> [Notita] {
        let context = container.viewContext
        
        // Crear una petición para obtener todas las notas
        let fetchRequest: NSFetchRequest<Notita> = Notita.fetchRequest()
        
        do {
            // Ejecutar la petición y obtener los resultados
            let notas = try context.fetch(fetchRequest)
            return notas
        } catch {
            print("Error al obtener las notas: \(error)")
            return []
        }
    }
    
    
    func obtenerNotaPorID(id: UUID) -> Notita? {//llave inicial obtener notita
        let context = container.viewContext
        
        // Crear una petición para buscar la nota por su ID
        let fetchRequest: NSFetchRequest<Notita> = Notita.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as NSUUID)
        
        do {
            // Ejecutar la petición y obtener los resultados
            let notas = try context.fetch(fetchRequest)
            
            // Si se encontró una nota, retornarla
            if let nota = notas.first {
                return nota
            } else {
                print("No se encontró ninguna nota con el ID proporcionado")
                return nil
            }
        } catch {
            print("Error al obtener la nota: \(error)")
            return nil
        }
    }//llave final metodo obtener notita
    
    
    func eliminarNota(conID id: UUID) {
        let context = container.viewContext
        
        // Crear una petición de fetch para encontrar la nota
        let fetchRequest: NSFetchRequest<Notita> = Notita.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as NSUUID)
        
        do {
            // Ejecutar la petición y obtener la nota
            let notas = try context.fetch(fetchRequest)
            
            if let nota = notas.first {
                // Eliminar la nota del contexto
                context.delete(nota)
                
                // Guardar los cambios en el contexto
                try context.save()
                print("Nota eliminada correctamente")
            } else {
                print("No se encontró ninguna nota con el ID proporcionado")
            }
        } catch {
            print("Error al eliminar la nota: \(error)")
        }
    }//llave final del metodo eliminar nota
    
    func actualizarNota(conID id: UUID, nuevoTitulo: String, nuevoTexto: String) {
        
        print("En actualizar nota");
        let context = container.viewContext

        // Crear una petición para buscar la nota por su ID
        let fetchRequest: NSFetchRequest<Notita> = Notita.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as NSUUID)

        do {
            // Ejecutar la petición y obtener los resultados
            let notas = try context.fetch(fetchRequest)

            if let nota = notas.first {
                // Actualizar los valores de la nota
                nota.titulo = nuevoTitulo
                nota.texto = nuevoTexto

                // Guardar los cambios en el contexto
                try context.save()
                print("Nota actualizada correctamente")
            } else {
                print("No se encontró ninguna nota con el ID proporcionado")
            }
        } catch {
            print("Error al actualizar la nota: \(error)")
        }
    }
    
}//llave final de la clase
