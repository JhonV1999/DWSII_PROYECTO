<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autor</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
<style type="text/css">
	.help-block {
	  		color: red;
	}
	
	.form-group.has-error .form-control-label {
	  color: red;
	}
	
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}

</style>
</head>
<body>
	<!-- The Modal -->
	  <div class="modal fade" id="modalEliminar" data-backdrop="static">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">Sistema</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	        	Seguro de eliminar Autor? 
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <form action="" method="post" name="myForm">	
			  	  <a class="btn btn-primary" id="btnEliminar">Si</a>
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>		           
	          </form>
	        </div>
	        
	      </div>
	    </div>
	  </div>


	<div class="container">
	<c:if test="${MENSAJE !=null}">
	<div class="alert alert-warning alert-dismissible fade show" role="alert" id="success-alert">
	  <strong>Sistema:</strong> ${MENSAJE}
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	<c:remove var="MENSAJE"/>
	
	
	
	 	<h1 align="center">Listado de Autores</h1>
	 	
	 	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAutor">
		  Nuevo Autor
		</button>
		<div class="mt-5">
			<table id="table" class="table table-striped table-bordered" style="width:100%">
		        <thead>
		            <tr>
		                <th>ID Autor</th>
		                <th>Nombres</th>
		                <th>Apellido Paterno</th>
		                <th>Apellido Materno</th>
		                <th>Pais</th>
		                <th></th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
				<c:forEach items="${requestScope.dataAutores}" var="row">
		            <tr>
		                <td>${row.idAutor}</td>
		                <td>${row.nombres}</td>
		                <td>${row.apaterno}</td>
		                <td>${row.amaterno}</td>
		                <td>${row.pais.nombre}</td>
		                <td><button type="button" class="btn btn-info btnEditar">Editar</button></td>
		                <td><a href="" class="btn btn-danger btnEliminar">Eliminar</a></td>  
		            </tr>
				</c:forEach>
		        </tbody>
	    	</table>		
		</div>
	
		
		<!-- Modal -->
		<div class="modal fade" id="modalAutor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="idTitulo">REGISTRAR AUTOR</h5>
		      </div>
		      <div class="modal-body">
		        <form id="frmAutor" action="save" method="post" data-toggle="validator" role="form">
				  <input type="text" name="idAutor" id="idAutor" value="0">
				  <div class="form-group">
				    <label for="exampleInputEmail1">nombres</label>
				    <input type="text" class="form-control" name="nombres" id="nombres">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">apaterno</label>
				    <input type="text" class="form-control" name="apaterno" id="apaterno">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">amaterno</label>
				    <input type="text" class="form-control" name="amaterno" id="amaterno">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Pais</label>
				    <select class="form-control" name="pais" id="pais">
				      <option value=" ">[Seleccione Pais]</option>
				    </select>
				  </div>
				  <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" id="btnCerrar">Cerrar</button>
			        <button type="submit" class="btn btn-primary">Guardar</button>
			      </div>	
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	 	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>

	
	
<script type="text/javascript">
	
	$(document).ready(function() {
			$("#table").DataTable();
		    cargarPaises();
	} );
	
	
//---------------------------------COMBO-------------------------------------//	
function cargarPaises(){
	fetch("listaPaises")
	.then(response=>response.json())
	.then(paises=>{
			paises.forEach(pais=>{
				$("#pais").append("<option value='"+ pais.idPais+"'>"+
						pais.nombre+"</option>");	
			})
	})
	
	
}

//---------------------------------ELIMINAR-------------------------------------//	
$(document).on("click",".btnEliminar",function(){

	
	

})
//---------------------------------EDITAR-------------------------------------//	
$(document).on("click",".btnEditar",function(){
	//obtener el c�digo de la Autor seg�n la fila actual
	var cod;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	fetch("buscar?idAutor="+cod)
	.then(response=>response.json())
	.then(autor=>{
		//console.log(Autor);
		$("#idAutor").val(autor.idAutor);
		$("#nombres").val(autor.nombres);
		$("#apaterno").val(autor.apaterno);
		$("#amaterno").val(autor.amaterno);
		$("#pais").val(autor.pais.idPais);
	})
	
	$("#idTitulo").text("ACTUALIZAR AUTOR");
	$('#modalAutor').modal({backdrop: 'static',keyboard:false,show:true});

	    
});	


//---------------------------------CERRAR-------------------------------------//	
$(document).on("click","#btnCerrar",function(){
	$('#frmAutor').trigger("reset");
	$('#frmAutor').data('bootstrapValidator').resetForm(true);
	$("#idAutor").val("0");		
	$("#idTitulo").text("REGISTRAR AUTOR");
	$('#modalAutor').modal("hide");
})

</script>
<script type="text/javascript">    
    $(document).ready(function(){     
        $('#frmAutor').bootstrapValidator({      
        	 fields:{
        		 nombres:{
        			 	validators:{
        			 		notEmpty:{
        			 			message:'Campo nombre es obligatorio'	
        			 		},
        			 		regexp:{
        			 			regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
        			 			message:'Campo nombre solo letras min 3 hasta max 15 letras'
        			 		}
        			 	}
        		 },   
     		 	apaterno:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo apaterno es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
    			 			message:'Campo apaterno max 59'
    			 		}
     			 	}
     		 	 },  
     		 	
     		 	amaterno:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo amaterno es obligatorio'	
     			 		},
     			 		regexp:{
     			 			regexp:/^[a-zA-Z\s\�\�\�\�]{3,15}$/,
    			 			message:'Campo amaterno min 3 cifras'
    			 		}
     			 	}
     		 	 },    
     		 	pais:{
     			 	validators:{
     			 		notEmpty:{
     			 			message:'Campo pais es obligatorio'	
     			 		}
     			 	}
     		 	 },    
     		 	 
     		 	 
        	 }
        });   
			
    });    
</script>
		
</body>
</html>