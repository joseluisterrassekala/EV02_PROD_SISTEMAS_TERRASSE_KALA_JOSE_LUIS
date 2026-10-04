<!DOCTYPE html>

<html>

<head>

```
<meta charset="UTF-8">

<title>Lista Computador Elitec</title>

<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/bootstrap.bundle.js" type="text/javascript"></script>
<script src="js/bootstrap.esm.js" type="text/javascript"></script>
<script src="js/jquery-4.0.0.min.js" type="text/javascript"></script>
<script src="js/datatables.js" type="text/javascript"></script>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-grid.css" rel="stylesheet">
<link href="css/bootstrap-reboot.css" rel="stylesheet">
<link href="css/bootstrap-utilities.css" rel="stylesheet">
<link href="css/datatables.css" rel="stylesheet">
```

</head>

<body>

```
<div class="container">

	<h1>Lista de Computador por marca</h1>

	<div class="row" style="margin-top: 2%;">

		<div class="col-3">

			<label for="marca">Marca</label>

		</div>

		<div class="col-6">

			<input type="text" class="form-control" id="marca"
				name="marca" placeholder="Ingrese la marca" maxlength="50">

		</div>

		<div class="col-3">

			<button class="btn btn-primary" id="btnBuscar"
				style="width: 200px">Buscar</button>

		</div>

	</div>

	<div class="row" style="margin-top: 2%;">

		<div class="col-12">

			<table class="table table-striped" id="id_table">

				<thead>

					<tr>

						<th>Código</th>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Procesador</th>
						<th>RAM</th>
						<th>Almacenamiento</th>
						<th>Tipo Almacenamiento</th>
						<th>Sistema Operativo</th>
						<th>Precio</th>

					</tr>

				</thead>

				<tbody>

				</tbody>

			</table>

		</div>

	</div>

</div>
```

</body>

<script type="text/javascript">

	$("#btnBuscar").click(function (e) {

		var varMarca = $("#marca").val();

		console.log(">>> marca: ", varMarca);

		$.ajax({

			url: "listaComputadorPorMarca",

			type: "GET",

			data: {marca: varMarca},

			success: function (response) {

				console.log(">>> response: ", response);

				agregarGrilla(response);

			},

			error: function () {

				alert("Error al buscar computadores por marca.");

			}

		});

	});


	function agregarGrilla(lista){

		$('#id_table').DataTable().clear();

		$('#id_table').DataTable().destroy();

		$('#id_table').DataTable({

			data: lista,

			language: IDIOMA,

			searching: true,

			ordering: true,

			processing: true,

			pageLength: 10,

			lengthChange: true,

			info: true,

			scrollY: 305,

			scroller: {

				loadingIndicator: true

			},

			columns:[

				{data: "idComputador", className:'text-center'},

				{data: "marca", className:'text-center'},

				{data: "modelo", className:'text-center'},

				{data: "procesador", className:'text-center'},

				{data: "ram", className:'text-center'},

				{data: "almacenamiento", className:'text-center'},

				{data: "tipoAlmacenamiento", className:'text-center'},

				{data: "sistemaOperativo", className:'text-center'},

				{data: "precio", className:'text-center'}

			]

		});

	}


	var IDIOMA = {

		processing:"procesando...",

		lengthMenu: "_MENU_ Registros por página",

		zeroRecords: "No existen registros",

		info: "Página _PAGE_ de _PAGES_",

		infoEmpty: "Sin registros",

		infoFiltered: "(Filtro de _MAX_ registros)",

		search: "Buscar:",

		paginate: {

			"first": "Primero",

			"last": "Último",

			"next": "Siguiente",

			"previous": "Anterior"

		}

	};

</script>

</html>
