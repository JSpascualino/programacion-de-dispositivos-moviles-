void main() {
  // ==========================================
  // -- Parte 1 · Variables y tipos --
  // ==========================================
  String nombre = "Carlos Pérez";
  int edad = 20;
  double promedio = 4.2;
  bool estaMatriculado = true;

  // Si guardáramos la edad como String ('20' en vez de 20), no podríamos realizar 
  // operaciones matemáticas directamente (como calcular el año de nacimiento o verificar
  // rangos numéricos) sin antes realizar un parseo explícito a tipo entero.

  print("=== FICHA DEL ESTUDIANTE ===");
  print("Nombre: $nombre");
  print("Edad: $edad años");
  print("Promedio: $promedio");
  print("Matrícula activa: $estaMatriculado\n");

  // ==========================================
  // -- Parte 2 · Null safety --
  // ==========================================
  String? apodo = null;
  // El apodo debe ser nullable porque no todos los estudiantes tienen uno
  // registrado. En cambio, los datos básicos de la ficha se consideran
  // obligatorios para nuestro sistema.

  if (apodo != null) {
    print("Apodo: $apodo");
  } else {
    print("El estudiante no tiene un apodo registrado.\n");
  }

  // El operador ! indica que Dart debe tratar la variable como no nula.
  // Si la variable realmente contiene null, el error aparece al ejecutar
  // el programa, no al escribir el código.

  // ==========================================
  // -- Parte 3 · Funciones --
  // ==========================================
  bool apruebaMateria(double nota) => nota >= 3.0;

  double calcularPromedio(List<double> notas) {
    if (notas.isEmpty) {
      return 0.0; // Evita error de división entre cero si la lista viene vacía
    }
    double suma = 0.0;
    for (double nota in notas) {
      suma += nota;
    }
    return suma / notas.length;
  }

  double notaFinal = 4.0;
  print("=== EVALUACIÓN Y PROMEDIO ===");
  print("¿Aprueba la materia con $notaFinal?: ${apruebaMateria(notaFinal)}");

  List<double> notasSemestre = [4.0, 3.5, 4.2, 2.8, 3.9];
  print("Promedio del semestre: ${calcularPromedio(notasSemestre)}\n");

  // ==========================================
  // -- Parte 4 · Colecciones --
  // ==========================================
  List<String> asistentes = ["Carlos", "Ana", "Carlos", "David"];

  Set<String> lenguajesConocidos = {"Dart", "Java", "Python"};
  // Para pensar: Si intentamos agregar "Dart" a un Set, el duplicado es ignorado.
  lenguajesConocidos.add("Dart");

  Map<String, double> notasEstudiantes = {
    "Carlos": 4.2,
    "Ana": 4.8,
    "David": 2.9
  };

  print("=== COLECCIONES ===");
  print("Lista de asistentes (List): $asistentes");
  print("Lenguajes conocidos (Set): $lenguajesConocidos");
  print("Nota de Ana (Map): ${notasEstudiantes['Ana']}\n");

  // ==========================================
  // -- Parte 5 · Control de flujo --
  // ==========================================
  // Problema A: Clasificación de rendimiento con 'for'
  List<double> todasLasNotas = [4.5, 2.8, 3.5, 4.8, 1.5, 3.9, 4.2];
  int reprobados = 0;
  int aprobados = 0;
  int sobresalientes = 0;

  for (double nota in todasLasNotas) {
    if (nota < 3.0) {
      reprobados++;
    } else if (nota <= 4.2) {
      aprobados++;
    } else {
      sobresalientes++;
    }
  }

  print("=== CONTROL DE FLUJO: PROBLEMA A ===");
  print("Notas evaluadas: $todasLasNotas");
  print("Reprobados: $reprobados");
  print("Aprobados: $aprobados");
  print("Sobresalientes: $sobresalientes\n");

  // Problema B: Límite de intentos con 'while'
  String claveCorrecta = "dart123";
  List<String> intentosIngresados = ["1234", "admin", "dart123"]; 
  int intentos = 0;
  int maxIntentos = 3;
  bool accesoConcedido = false;

  print("=== CONTROL DE FLUJO: PROBLEMA B ===");
  while (intentos < maxIntentos && !accesoConcedido) {
    String claveIngresada = intentosIngresados[intentos];
    intentos++;
    print("Intento $intentos: probando con '$claveIngresada'...");

    if (claveIngresada == claveCorrecta) {
      accesoConcedido = true;
      print("¡Acceso concedido!\n");
    } else {
      print("Contraseña incorrecta.");
    }
  }

  if (!accesoConcedido) {
    print("Acceso bloqueado: superó el número máximo de intentos.\n");
  }

  // Para pensar Parte 5: El Problema A se resuelve mejor con un 'for' porque
  // conocemos de antemano el número de elementos a recorrer (la lista de notas).
  // El Problema B se resuelve mejor con un 'while' porque la cantidad de iteraciones
  // es indeterminada y depende de si la condición se cumple o se interrumpe antes.

  // ==========================================
  // -- Parte 6 · Clases y POO --
  // ==========================================
  Estudiante e1 = Estudiante("Carlos Pérez", 4, [4.0, 3.8, 4.5]);
  Estudiante e2 = Estudiante("María Gómez", 2, [2.5, 2.8, 3.0]); // No está al día

  print("=== CLASES Y POO ===");
  print("Estudiante 1: ${e1.nombre} | Promedio: ${e1.obtenerPromedio().toStringAsFixed(2)} | ¿Al día?: ${e1.estaAlDia()}");
  print("Estudiante 2: ${e2.nombre} | Promedio: ${e2.obtenerPromedio().toStringAsFixed(2)} | ¿Al día?: ${e2.estaAlDia()}\n");

  // Para pensar Parte 6: Modelar esto con clases garantiza encapsulamiento y coherencia en los datos.
  // Tener tres listas separadas sincronizadas por posición es frágil y propenso a errores de desfase.

  // ==========================================
  // -- Reto integrador · Gestor de Tareas --
  // ==========================================
  print("=== RETO INTEGRADOR: GESTOR DE TAREAS ===");

  List<Tarea> listaTareas = [
    Tarea("Entregar Taller de Dart", "Alta"),
    Tarea("Leer documentación de Flutter", "Media"),
    Tarea("Organizar escritorio de trabajo", "Baja"),
    Tarea("Preparar exposición de POO", "Alta"),
    Tarea("Repasar sintaxis de null safety", "Baja")
  ];

  // Marcar una tarea como completada
  listaTareas[0].completarTarea();

  // Contar tareas pendientes
  int pendientes = listaTareas.where((t) => !t.completada).length;
  print("Tareas pendientes restantes: $pendientes\n");

  // Listar todas las tareas organizadas por prioridad
  print("--- LISTADO GENERAL DE TAREAS ---");
  for (Tarea t in listaTareas) {
    String estado = t.completada ? "[COMPLETADA]" : "[PENDIENTE]";
    print("$estado | Prioridad: ${t.prioridad.padRight(5)} | Título: ${t.titulo}");
  }

  // BONUS: Conteo por nivel de prioridad
  int altaCount = listaTareas.where((t) => t.prioridad == "Alta").length;
  int mediaCount = listaTareas.where((t) => t.prioridad == "Media").length;
  int bajaCount = listaTareas.where((t) => t.prioridad == "Baja").length;

  print("\n--- BONUS: CONTEO POR PRIORIDAD ---");
  print("Prioridad Alta: $altaCount");
  print("Prioridad Media: $mediaCount");
  print("Prioridad Baja: $bajaCount\n");

  // Para pensar Reto Integrador: Si mañana nos piden agregar una fecha límite opcional,
  // el diseño resiste perfectamente declarando un nuevo atributo nullable en la clase Tarea:
  // DateTime? fechaLimite;
  // Al ser opcional (nullable), no rompería el código existente y podría ser null por defecto.
}

// ==========================================
// -- DEFINICIÓN DE CLASES (Fuera de main) --
// ==========================================

class Estudiante {
  String nombre;
  int semestre;
  List<double> notas;

  Estudiante(this.nombre, this.semestre, this.notas);

  double obtenerPromedio() {
    if (notas.isEmpty) return 0.0;
    double suma = 0.0;
    for (double n in notas) {
      suma += n;
    }
    return suma / notas.length;
  }

  bool estaAlDia() {
    return obtenerPromedio() >= 3.0;
  }
}

class Tarea {
  String titulo;
  String prioridad; // Alta, Media, Baja
  bool completada;

  Tarea(this.titulo, this.prioridad, {this.completada = false});

  void completarTarea() {
    completada = true;
  }
}
