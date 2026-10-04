package controller;

import java.io.IOException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entity.Computador;
import entity.Tipo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ComputadorModel;

@WebServlet("/registroComputadorAlias")

public class RegistroComputadorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1 Recibir los datos enviados desde el formulario

		String marca = req.getParameter("marca");
		String modelo = req.getParameter("modelo");
		String procesador = req.getParameter("procesador");
		int ram = Integer.parseInt(req.getParameter("ram"));
		int almacenamiento = Integer.parseInt(req.getParameter("almacenamiento"));
		String tipoAlmacenamiento = req.getParameter("tipoAlmacenamiento");
		String sistemaOperativo = req.getParameter("sistemaOperativo");
		double precio = Double.parseDouble(req.getParameter("precio"));
		int idTipo = Integer.parseInt(req.getParameter("tipo"));

		//2 Crear el objeto Tipo

		Tipo tipo = new Tipo();
		tipo.setIdTipo(idTipo);

		//3 Crear el objeto Computador

		Computador computador = new Computador();

		computador.setMarca(marca);
		computador.setModelo(modelo);
		computador.setProcesador(procesador);
		computador.setRam(ram);
		computador.setAlmacenamiento(almacenamiento);
		computador.setTipoAlmacenamiento(tipoAlmacenamiento);
		computador.setSistemaOperativo(sistemaOperativo);
		computador.setPrecio(precio);
		computador.setTipo(tipo);

		//4 Registrar el computador en la base de datos

		ComputadorModel model = new ComputadorModel();

		int resultado = model.registrarComputador(computador);

		//5 Construir respuesta JSON

		String mensaje;

		if (resultado > 0) {
			mensaje = "Computador registrado correctamente.";
		} else {
			mensaje = "Error al registrar computador.";
		}

		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String jsonSalida = gson.toJson(mensaje);

		//6 Enviar respuesta al cliente

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		resp.getWriter().write(jsonSalida);
	}
}