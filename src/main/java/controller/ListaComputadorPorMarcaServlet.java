package controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entity.Computador;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ComputadorModel;

@WebServlet("/listaComputadorPorMarca")
public class ListaComputadorPorMarcaServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1 Recibir el parametro de la marca
		String marca = req.getParameter("marca");
		
		//2 Crear un objeto ComputadorModel
		ComputadorModel model = new ComputadorModel();
		List<Computador> lista = model.listaComputadorPorMarca(marca);
		
		//3 Enviar la lista de computadores al cliente en JSON
		resp.setContentType("application/json");
		
		//4 Construir el JSON mediante Gson modo pretty print
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonSalida = gson.toJson(lista);
		
		System.out.println("Respuesta JSON: " + jsonSalida);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(jsonSalida);
		
		
	}
	
}
