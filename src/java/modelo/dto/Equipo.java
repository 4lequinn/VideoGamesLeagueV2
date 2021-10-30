/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author jorge
 */
@Entity
@Table(name = "equipo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Equipo.findAll", query = "SELECT e FROM Equipo e")
    , @NamedQuery(name = "Equipo.findById", query = "SELECT e FROM Equipo e WHERE e.id = :id")
    , @NamedQuery(name = "Equipo.findByNombre", query = "SELECT e FROM Equipo e WHERE e.nombre = :nombre")
    , @NamedQuery(name = "Equipo.findByCantidadJugador", query = "SELECT e FROM Equipo e WHERE e.cantidadJugador = :cantidadJugador")})
public class Equipo implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEquipo")
    private List<DetallePartido> detallePartidoList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad_jugador")
    private int cantidadJugador;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEquipo")
    private List<DetalleEquipo> detalleEquipoList;
    @JoinColumn(name = "id_liga", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Liga idLiga;
    @JoinColumn(name = "id_perfil", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PerfilJugador idPerfil;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idEquipo")
    private List<Incripcion> incripcionList;

    public Equipo() {
    }

    public Equipo(Integer id) {
        this.id = id;
    }

    public Equipo(Integer id, String nombre, int cantidadJugador) {
        this.id = id;
        this.nombre = nombre;
        this.cantidadJugador = cantidadJugador;
    }
    
     public Equipo( String nombre, int cantidadJugador, PerfilJugador idPerfil, Liga idLiga) {
        this.nombre = nombre;
        this.cantidadJugador = cantidadJugador;
        this.idLiga = idLiga;
        this.idPerfil = idPerfil;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadJugador() {
        return cantidadJugador;
    }

    public void setCantidadJugador(int cantidadJugador) {
        this.cantidadJugador = cantidadJugador;
    }

    @XmlTransient
    public List<DetalleEquipo> getDetalleEquipoList() {
        return detalleEquipoList;
    }

    public void setDetalleEquipoList(List<DetalleEquipo> detalleEquipoList) {
        this.detalleEquipoList = detalleEquipoList;
    }

    public Liga getIdLiga() {
        return idLiga;
    }

    public void setIdLiga(Liga idLiga) {
        this.idLiga = idLiga;
    }

    public PerfilJugador getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(PerfilJugador idPerfil) {
        this.idPerfil = idPerfil;
    }

    @XmlTransient
    public List<Incripcion> getIncripcionList() {
        return incripcionList;
    }

    public void setIncripcionList(List<Incripcion> incripcionList) {
        this.incripcionList = incripcionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Equipo)) {
            return false;
        }
        Equipo other = (Equipo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Equipo[ id=" + id + " ]";
    }

    @XmlTransient
    public List<DetallePartido> getDetallePartidoList() {
        return detallePartidoList;
    }

    public void setDetallePartidoList(List<DetallePartido> detallePartidoList) {
        this.detallePartidoList = detallePartidoList;
    }
    
}
