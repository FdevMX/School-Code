package estudiante;

public class Main {
    public static void main(String[] args) {
        Estudiante estudiante = new Estudiante("Said", 72.23);
        System.out.println("Nombre del alumno: " + estudiante.getNombre());
        System.out.println("Calificacion: " + estudiante.getPromedio());
        System.out.println("Promedio: " + estudiante.obtenerCalificacionEstudiante() + "\n");


        estudiante.establecerNombre("Owen");
        estudiante.establecerPromedio(89.0);
        
        System.out.println("Nombre del alumno: " + estudiante.getNombre());
        System.out.println("Calificacion: " + estudiante.getPromedio());
        System.out.println("Promedio: " + estudiante.obtenerCalificacionEstudiante());
    }
}
