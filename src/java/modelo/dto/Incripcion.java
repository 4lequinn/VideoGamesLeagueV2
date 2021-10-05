/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author jorge
 */
@Entity
@Table(name = "incripcion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Incripcion.findAll", query = "SELECT i FROM Incripcion i")
    , @NamedQuery(name = "Incripcion.findById", query = "SELECT i FROM Incripcion i WHERE i.id = :id")
    , @NamedQuery(name = "Incripcion.findByFecha", query = "SELECT i FROM Incripcion i WHERE i.fecha = :fecha")})
public class Incripcion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idInscripcion")
    private List<DetalleEquipo> detalleEquipoList;
    @JoinColumn(name = "id_jugador", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PerfilJugador idJugador;
    @JoinColumn(name = "id_estado", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EstadoSolicitud idEstado;
    @JoinColumn(name = "id_equipo", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Equipo idEquipo;

    public Incripcion() {
    }

    public Incripcion(Integer id) {
        this.id = id;
    }

    public Incripcion(Integer id, Date fecha) {
        this.id = id;
        this.fecha = fecha;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @XmlTransient
    public List<DetalleEquipo> getDetalleEquipoList() {
        return detalleEquipoList;
    }

    public void setDetalleEquipoList(List<DetalleEquipo> detalleEquipoList) {
        this.detalleEquipoList = detalleEquipoList;
    }

    public PerfilJugador getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(PerfilJugador idJugador) {
        this.idJugador = idJugador;
    }

    public EstadoSolicitud getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(EstadoSolicitud idEstado) {
        this.idEstado = idEstado;
    }

    public Equipo getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(Equipo idEquipo) {
        this.idEquipo = idEquipo;
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
        if (!(object instanceof Incripcion)) {
            return false;
        }
        Incripcion other = (Incripcion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Incripcion[ id=" + id + " ]";
    }
    
}
