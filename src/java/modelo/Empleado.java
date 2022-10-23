/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author nacho
 */
public class Empleado extends Persona {
    private String codigo;
    private int id_puesto;
    private Conexion cn;
    
    public Empleado() {}

    public Empleado(String codigo, int id_puesto, int id, String nombres, String apellidos,String direccion, String dpi, String telefono, String fecha_nacimiento, String fecha_ingreso) {
        super(id, nombres, apellidos, direccion, dpi, telefono, fecha_nacimiento, fecha_ingreso);
        this.codigo = codigo;
        this.id_puesto = id_puesto;
    }

    public Empleado(String parameter, Integer valueOf, Integer valueOf0, String parameter0, String parameter1, String parameter2, String parameter3, String parameter4, String parameter5, String parameter6, String parameter7) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }
     
    public DefaultTableModel leer(){
    DefaultTableModel tabla  = new DefaultTableModel();
    try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query = "SELECT e.id_empleado as id, e.codigo, e.nombres, e.apellidos,e.direccion, e.dpi, e.telefono, e.fecha_nacimiento, e.fecha_ingreso, g.puesto, g.id_puesto FROM empleados as e inner join puesto as g on e.id_puesto = g.id_puesto;";
        ResultSet consulta = cn.conexionDB.createStatement().executeQuery(query);
        String encabezado[] =  {"ID","Codigo","Nombres", "Apellidos","Direccion", "DPI", "Telefono", "Fecha de Nacimiento", "Fecha de Ingreso", "Puesto", "ID Puesto"};
        tabla.setColumnIdentifiers(encabezado);
        String datos []= new String [11];
        while (consulta.next()){
        datos[0] = consulta.getString("id");
        datos[1] = consulta.getString("codigo");
        datos[2] = consulta.getString("nombres");
        datos[3] = consulta.getString("apellidos");
        datos[4] = consulta.getString("direccion");
        datos[5] = consulta.getString("dpi");
        datos[6] = consulta.getString("telefono");
        datos[7] = consulta.getString("fecha_nacimiento");
        datos[8] = consulta.getString("fecha_ingreso");
        datos[9] = consulta.getString("puesto");
        datos[10] = consulta.getString("id_puesto");
        tabla.addRow(datos);
        }
        cn.cerrar_conexion();
    }catch(SQLException ex){
       System.out.println(ex.getMessage());
    }    
    return tabla;
    }
    
    @Override
    public int agregar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;    
        cn=new Conexion();
        String query="INSERT INTO empleados(codigo,nombres,apellidos,direccion,dpi,telefono,fecha_nacimiento,fecha_ingreso,id_puesto) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionDB.prepareStatement(query);
        parametro.setString(1, getCodigo());
        parametro.setString(2, getNombres());
        parametro.setString(3, getApellidos());
        parametro.setString(4, getDireccion());
        parametro.setString(5, getDpi());
        parametro.setString(6, getTelefono());
        parametro.setString(7, getFecha_nacimiento());
        parametro.setString(8, getFecha_ingreso());
        parametro.setInt(9, getId_puesto());
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }   
    return retorno;
    }
    
    @Override
    public int modificar (){
        int retorno = 0;
    try{
        PreparedStatement parametro;    
        cn=new Conexion();
        String query="UPDATE empleados set codigo=?,nombres=?,apellidos=?, direccion=?, dpi=?,telefono=?,fecha_nacimiento=?,fecha_ingreso=?,id_puesto=? where id_empleado=?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionDB.prepareStatement(query);
        parametro.setString(1, getCodigo());
        parametro.setString(2, getNombres());
        parametro.setString(3, getApellidos());
        parametro.setString(4, getDireccion());
        parametro.setString(5, getDpi());
        parametro.setString(6, getTelefono());
        parametro.setString(7, getFecha_nacimiento());
        parametro.setString(8, getFecha_ingreso());
        parametro.setInt(9, getId_puesto());
        parametro.setInt(10, getId());
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }   
    return retorno;
    }
    
    @Override
    public int eliminar (){
        int retorno = 0;
    try{
        PreparedStatement parametro;    
        cn=new Conexion();
        String query="DELETE FROM empleados where id_empleado=?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionDB.prepareStatement(query);
        parametro.setInt(1, getId());
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
        retorno = 0;
    }   
    return retorno;
    }
    
    
}
