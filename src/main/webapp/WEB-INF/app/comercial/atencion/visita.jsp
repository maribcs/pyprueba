<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<t:wrapper title="Visitas">
    <a href="${pageContext.request.contextPath}/com/atencion/new" class="pull-right btn btn-primary"> Nuevo</a>
    <h1>Visitas</h1>
    <table class="table table-striped">
        <tr>
            <th class="col-md-2">Mascota</th>
            <th class="col-md-3">Ingreso</th>
            <th class="col-md-2">Veterinario</th>
            <th class="col-md-3">Salida</th>
            <th class="col-md-2">Estado</th>
            <th class="col-md-2">Acciones</th>
        </tr>
        <c:forEach items="${visitas}" var="v"  >
            <tr>
                <td> 
                    ${v.mascota.nombre}<br/>
                    ${v.mascota.raza.nombre}<br/>
                    ${v.mascota.especie.nombre}
                </td>
                <td> 
                    Fecha de Ingreso: <fmt:formatDate value="${v.fechaIngreso}" pattern="dd/MM/yyyy" /><br/>  
                    Motivo: ${v.motivo}<br/>                      
                </td>
                <td> 
                    Veterninario: ${v.veterinario.persona.getNombreCompleto()}<br/>                      
                </td>                
                <td> 
                    Fecha de Salida: <fmt:formatDate value="${v.fechaSalida}" pattern="dd/MM/yyyy" /><br/>  
                    Proxima visita: ${v.proximaVisita}<br/>                      
                </td>
                <td> 
                    <span class="label label-${v.fechaSalida == null ? "success" :"danger" }">
                        ${v.fechaSalida == null ? "Internado" :"Finalizado" }
                    </span>                    
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/com/atencion/update/${v.id}">Editar</a> 
                    <a href="${pageContext.request.contextPath}/com/atencion/delete/${v.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>


</t:wrapper>