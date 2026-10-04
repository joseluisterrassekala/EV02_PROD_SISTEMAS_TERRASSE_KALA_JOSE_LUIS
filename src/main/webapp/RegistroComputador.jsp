<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

```
<meta charset="UTF-8">

<title>Registro Computador Elitec</title>

<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/bootstrap.bundle.js" type="text/javascript"></script>
<script src="js/bootstrap.esm.js" type="text/javascript"></script>
<script src="js/jquery-4.0.0.min.js" type="text/javascript"></script>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-grid.css" rel="stylesheet">
<link href="css/bootstrap-reboot.css" rel="stylesheet">
<link href="css/bootstrap-utilities.css" rel="stylesheet">
```

</head>

<body>

```
<div class="container">

	<h1>Registro de Computador</h1>

	<form id="form" method="post" novalidate>

		<div class="row" style="margin-top: 2%;">

			<div class="col-4">

				<label for="marca">Marca</label>

				<input type="text" class="form-control" id="marca"
					name="marca" placeholder="Ingrese la marca"
					maxlength="50" required>

				<div class="invalid-feedback">Ingrese la marca</div>

			</div>

			<div class="col-4">

				<label for="modelo">Modelo</label>

				<input type="text" class="form-control" id="modelo"
					name="modelo" placeholder="Ingrese el modelo"
					maxlength="50" required>

				<div class="invalid-feedback">Ingrese el modelo</div>

			</div>

			<div class="col-4">

				<label for="procesador">Procesador</label>

				<input type="text" class="form-control" id="procesador"
					name="procesador" placeholder="Ingrese el procesador"
					maxlength="100" required>

				<div class="invalid-feedback">Ingrese el procesador</div>

			</div>

		</div>


		<div class="row" style="margin-top: 2%;">

			<div class="col-4">

				<label for="ram">RAM (GB)</label>

				<input type="number" class="form-control" id="ram"
					name="ram" placeholder="Ingrese la RAM"
					required>

				<div class="invalid-feedback">Ingrese la RAM</div>

			</div>

			<div class="col-4">

				<label for="almacenamiento">Almacenamiento (GB)</label>

				<input type="number" class="form-control" id="almacenamiento"
					name="almacenamiento" placeholder="Ingrese el almacenamiento"
					required>

				<div class="invalid-feedback">Ingrese el almacenamiento</div>

			</div>

			<div class="col-4">

				<label for="tipoAlmacenamiento">Tipo de almacenamiento</label>

				<input type="text" class="form-control" id="tipoAlmacenamiento"
					name="tipoAlmacenamiento" placeholder="Ejemplo: SSD"
					maxlength="50" required>

				<div class="invalid-feedback">Ingrese el tipo de almacenamiento</div>

			</div>

		</div>


		<div class="row" style="margin-top: 2%;">

			<div class="col-4">

				<label for="sistemaOperativo">Sistema operativo</label>

				<input type="text" class="form-control" id="sistemaOperativo"
					name="sistemaOperativo" placeholder="Ejemplo: Windows 11"
					maxlength="50" required>

				<div class="invalid-feedback">Ingrese el sistema operativo</div>

			</div>

			<div class="col-4">

				<label for="precio">Precio</label>

				<input type="number" step="0.01" class="form-control"
					id="precio" name="precio" placeholder="Ingrese el precio"
					required>

				<div class="invalid-feedback">Ingrese el precio</div>

			</div>

			<div class="col-4">

				<label for="tipo">Tipo</label>

				<select class="form-control" id="tipo" name="tipo" required>

					<option value="">[Seleccione]</option>

				</select>

				<div class="invalid-feedback">Seleccione el tipo</div>

			</div>

		</div>


		<div class="row justify-content-center" style="margin-top: 2%">

			<button class="btn btn-primary" id="btnRegistrar"
				style="width: 200px">Registrar</button>

		</div>

	</form>

</div>


<script type="text/javascript">

	$(document).ready(function () {

		$.ajax({

			url: 'cargaComboTipoAlias', // URL del servlet para obtener categorías

			type: 'GET',

			success: function (data) {

				console.log('Categorías cargadas:', data);

				var comboBox = $('#tipo');

				data.forEach(function (obj) {

					comboBox.append('<option value="' + obj.idTipo + '">' + obj.descripcion + '</option>');

				});

			},

			error: function (xhr, status, error) {

				console.error('Error al cargar categorías:', error);

			}

		});

	});


	$("#btnRegistrar").click(function(e) {

		console.log("click en registrar");

		e.preventDefault(); //Evita que el formulario se envíe automáticamente

		let form = $('#form')[0];

		if (form.checkValidity() === false) {

			$(form).addClass('was-validated');

			return;

		}


		$.ajax({

			url: 'registroComputadorAlias',

			type: 'POST',

			data: $(form).serialize(),

			success: function (response) {

				console.log('response >>> ' + response);

				//limpiar el formulario

				$('#form')[0].reset();

				//limpiar las validaciones

				$('#form').removeClass('was-validated');

				//enviar un mensaje de éxito al usuario en forma de div que dure 3 segundos

				$('#form').prepend('<div class="alert alert-success" role="alert">' + response + '</div>');

				setTimeout(function () {

					$('.alert').remove();

				}, 3000);

			},

			error: function (xhr, status, error) {

				// Manejar errores aquí

				console.error('Error al registrar :', error);

			}

		});

	});

</script>
```

</body>

</html>
