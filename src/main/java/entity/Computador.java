package entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Computador {

	private int idComputador;
	private String marca;
	private String modelo;
	private String procesador;
	private int ram;
	private int almacenamiento;
	private String tipoAlmacenamiento;
	private String sistemaOperativo;
	private double precio;
	private Tipo tipo;
	
}
