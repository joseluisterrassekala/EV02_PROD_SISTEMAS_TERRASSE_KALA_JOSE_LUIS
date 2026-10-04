package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Computador;
import util.MySqlDBConexion;

public class ComputadorModel {

	public int registrarComputador(Computador computador) {

		int resultado = 0;

		String sql = "insert into computadores "
				+ "(marca, modelo, procesador, ram, almacenamiento, "
				+ "tipoAlmacenamiento, sistemaOperativo, precio, idTipo) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = MySqlDBConexion.getConexion();
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, computador.getMarca());
			pstm.setString(2, computador.getModelo());
			pstm.setString(3, computador.getProcesador());
			pstm.setInt(4, computador.getRam());
			pstm.setInt(5, computador.getAlmacenamiento());
			pstm.setString(6, computador.getTipoAlmacenamiento());
			pstm.setString(7, computador.getSistemaOperativo());
			pstm.setDouble(8, computador.getPrecio());
			pstm.setInt(9, computador.getTipo().getIdTipo());

			resultado = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return resultado;
	}

	public List<Computador> listaComputadorPorMarca(String marca) {

		ArrayList<Computador> lista = new ArrayList<Computador>();

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			conn = MySqlDBConexion.getConexion();

			String sql = "select * from computadores where marca = ?";

			pstm = conn.prepareStatement(sql);
			pstm.setString(1, marca);

			rs = pstm.executeQuery();

			while (rs.next()) {

				Computador computador = new Computador();

				computador.setIdComputador(rs.getInt("idComputador"));
				computador.setMarca(rs.getString("marca"));
				computador.setModelo(rs.getString("modelo"));
				computador.setProcesador(rs.getString("procesador"));
				computador.setRam(rs.getInt("ram"));
				computador.setAlmacenamiento(rs.getInt("almacenamiento"));
				computador.setTipoAlmacenamiento(rs.getString("tipoAlmacenamiento"));
				computador.setSistemaOperativo(rs.getString("sistemaOperativo"));
				computador.setPrecio(rs.getDouble("precio"));

				lista.add(computador);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return lista;
	}
}