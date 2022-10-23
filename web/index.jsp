<%-- 
    Document   : index
    Created on : 22/10/2022, 15:58:27
    Author     : nacho
--%>
<%@page import ="modelo.Puesto" %>
<%@page import ="modelo.Empleado" %>
<%@page import ="javax.swing.table.DefaultTableModel" %>
<%@page import ="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    </head>
     
    
        <h1>Formulario Empleados</h1>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick ='limpiar()'>Nuevo</button>
       
        <div class="container"> 
            <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
       
        <div class="modal-body">
          <form action="sr_empleado" method="post" class="form-group">
                
                <label for="lbl_id"> <b>No. Empleado:</b> </label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                     
                <label for="lbl_codigo"> <b>ID:</b> </label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="ID001" required>
                
                <label for="lbl_nombres"> <b>Nombres:</b> </label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Nombre1 Nombre2" required>
                
                <label for="lbl_apellidos"> <b>Apellidos:</b> </label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Apellido1 Apellido 2" required>
                
                <label for="lbl_direccion"> <b>Direccion:</b> </label>
                <input type="text" name="txt_apellidos" id="txt_direccion" class="form-control" placeholder="Casa #00 Calle #" required>
                
                <label for="lbl_dpi"> <b> DPI: </b> </label>
                <input type="number" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="00000000" required>
                
                <label for="lbl_telefono"> <b> Telefono: </b> </label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="00000000" required>
                
                <label for="lbl_fecha_nacimiento"> <b> Fecha de Nacimiento: </b> </label>
                <input type="date" name="txt_fecha_nacimiento" id="txt_fecha_nacimiento" class="form-control" required>
                
                <label for="lbl_fecha_ingreso"> <b> Fecha de Ingreso: </b> </label>
                <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
                
                <label for="lbl_puesto"> <b> Puesto: </b> </label>
                <select name="drop_puesto" id="drop_puesto" class="form-control" >
                     <%
                    Puesto puesto = new Puesto();
                    HashMap<String, String> drop = puesto.drop_puesto();
                    for (String i: drop.keySet()){
                      out.println(" <option value='"+ i +"'>"+drop.get(i)+"</option>");
                        }
                    %>
                </select>
                
                <br> 
               <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg">Agregar</button>
               <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success btn-lg">Modificar</button>
               <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
          </form>
        </div>
      </div>
      
    </div>
  </div>
            
                
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>DPI</th>
        <th>Telefono</th>
        <th>Fecha de Nacimiento</th>
        <th>Fecha de Ingreso</th>
        <th>Puesto</th>
      </tr>
    </thead>
    <tbody id="tbl_empleados">
        <%
          Empleado empleado = new Empleado();
          DefaultTableModel tabla  = new DefaultTableModel();
          tabla = empleado.leer();   
          for(int t=0; t<tabla.getRowCount(); t++){
               out.println("<tr data-id="+ tabla.getValueAt(t,0) + "data-id_g="+ tabla.getValueAt(t,10) +">");
               out.println("<td>"+ tabla.getValueAt(t,1) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,2) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,3) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,4) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,5) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,6) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,7) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,8) + "</td>");
               out.println("<td>"+ tabla.getValueAt(t,9) + "</td>");
               out.println("</tr>");
            }

        %>
       
    </tbody>
  </table>
                
         </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar (){
               $("#txt_id").val(0);             
               $("#txt_codigo").val('');             
               $("#txt_nombres").val('');             
               $("#txt_apellidos").val('');   
               $("#txt_direccion").val(''); 
               $("#txt_dpi").val('');             
               $("#txt_telefono").val('');             
               $("#txt_fecha_nacimiento").val('');             
               $("#txt_fecha_ingreso").val('');             
               $("#drop_puesto").val(1);               
            }
            
            
            $('#tbl_empleados').on('click','tr td', function(evt){
               var target,id,id_g,codigo,nombres,apellidos,direccion,dpi,telefono,fecha_nacimiento,fecha_ingreso;
               target = $(event.target);
               id = target.parent().data('id');
               id_g = target.parent().data('id_g');
               codigo = target.parent("tr").find("td").eq(0).html();
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html();
               direccion = target.parent("tr").find("td").eq(3).html();
               dpi = target.parent("tr").find("td").eq(4).html();
               telefono = target.parent("tr").find("td").eq(5).html();
               fecha_nacimiento = target.parent("tr").find("td").eq(6).html();
               fecha_ingreso = target.parent("tr").find("td").eq(7).html();
               $("#txt_id").val(id);             
               $("#txt_codigo").val(codigo);             
               $("#txt_nombres").val(nombres);             
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion); 
               $("#txt_dpi").val(dpi);             
               $("#txt_telefono").val(telefono);             
               $("#txt_fecha_nacimiento").val(fecha_nacimiento);             
               $("#txt_fecha_ingreso").val(fecha_ingreso);             
               $("#drop_puesto").val(id_g); 
               $("#modal_empleado").modal('show');
               });
            
        </script>
    
</html>
