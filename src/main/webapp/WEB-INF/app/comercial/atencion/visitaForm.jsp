<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:wrapper title="Visita">
    <h1 class="page-header"> Visita </h1>

    <form action="${pageContext.request.contextPath}/com/atencion/save" method="post">

        <input type="hidden" name="id" value="${visita.id}"/>

        <div class="form-group">
            <label class="control-label"> Mascota </label>

            <select name="mascota.id" class="form-control" ${visita.id == 5536 ? 'disabled' : ""}> 
                <c:forEach items="${mascotas}" var="m" >
                    <option value="${m.id}"  ${visita.mascota.id == m.id ? 'selected': '' }> ${m.nombre} </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label class="control-label"> Motivo </label>
            <textarea class="form-control" name="motivo">${visita.motivo}</textarea>
        </div>
        <div class="form-group">
            <label class="control-label"> Fecha de Ingreso</label>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input type="text" class="form-control" name="fechaIngreso" value="${visita.fechaIngreso}">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label"> Veterinario </label>

            <select name="veterinario.id" class="form-control" ${visita.id == 6363 ? disabled : ""}> 
                <c:forEach items="${veterinarios}" var="v" >
                    <option value="${v.id}"  ${visita.veterinario.id == v.id ? 'selected': '' }> ${v.persona.getNombreCompleto()} </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label class="control-label"> Diagnostico </label>
            <textarea class="form-control" name="diagnostico">${visita.diagnostico}</textarea>
        </div>
        <div class="form-group">
            <label class="control-label"> Tratamiento </label>
            <textarea class="form-control" name="tratamiento" >${visita.tratamiento}</textarea>
        </div>
        <div class="form-group">
            <label class="control-label"> Dieta </label>
            <textarea class="form-control" name="dieta" >${visita.dieta}</textarea>
        </div>
        <div class="form-group">
            <label class="control-label"> Fecha de Salida </label>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker2'>
                    <input type="text" class="form-control" name="fechaSalida" value="${visita.fechaSalida}">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>        
        <div class="form-group">
            <label class="control-label"> Proxima Visita </label>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker3'>
                    <input type="text" class="form-control" name="proximaVisita" value="${visita.proximaVisita}">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="${pageContext.request.contextPath}/com/atencion" class="btn btn-link">Cancelar</a>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
            })
            $('#datetimepicker2').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:ss',
                useCurrent: false
            })
            $('#datetimepicker3').datetimepicker({
                format: 'YYYY-MM-DD',
                useCurrent: false
            })
            $("#datetimepicker1").on("dp.change", function (e) {
                $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker2").on("dp.change", function (e) {
                $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
            });
            
        });

    </script>
</t:wrapper>