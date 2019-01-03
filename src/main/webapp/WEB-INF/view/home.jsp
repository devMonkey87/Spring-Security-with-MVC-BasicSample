



<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- //IMPORTANTÍSIMO PARA PODER VER EN LA WEB LOS DATOS DE SECURITY CUANDO HACEMOS USO DE SUS ETIQUETAS -->
<!-- //COMO POR EJEMPLO VEMOS EN LA SIGUIENTE LÍNEA COMENTADA: -->
<%-- <security:authentication property="principal.username" /> --%>

<!-- HEMOS DE AÑADIR LA SIGUIENTE ANOTACIÓN DE TAGLIB CON PREFIJO "SECURITY" -->

<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="es">

<head>

<title>Company Home Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

	

	<div>



		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-2">


			<!-- Add a logout button -->
			
	<form:form action="${pageContext.request.contextPath}/logout"
				method="POST">

				<input type="submit" value="Logout" />

			</form:form>


			<div class="jumbotron jumbotron-fluid">
				<div class="container">
					<h1 class="display-6" , style="text-align: center; color: blue;">PÁGINA
						INICIAL</h1>
					<p class="lead">Welcome!</p>

					<div>

						USUARIO:
						<security:authentication property="principal.username" />
						<br> <br> Role(s):
						<security:authentication property="principal.authorities" />
						<br> <br> NOMBRE: ${user.firstName}, APELLIDO:
						${user.lastName}, Email: ${user.email} <br>

						<security:authorize access="hasRole('MANAGER')">

							<!-- Add a link to point to /leaders ... this is for the managers -->

							<p>
								<a href="${pageContext.request.contextPath}/leaders">Leadership
									Meeting</a> (Solo visible para usuarios MANAGER)
							</p>

						</security:authorize>


						<security:authorize access="hasRole('ADMIN')">

							<!-- Add a link to point to /systems ... this is for the admins -->

							<p>
								<a href="${pageContext.request.contextPath}/systems">IT
									Systems Meeting</a> (Solo visible para usuarios ADMIN)
							</p>

						</security:authorize>

					</div>
				</div>
			</div>






		</div>
	</div>
</body>
</html>















