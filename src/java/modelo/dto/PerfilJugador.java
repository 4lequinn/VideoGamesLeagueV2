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
@Table(name = "perfil_jugador")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PerfilJugador.findAll", query = "SELECT p FROM PerfilJugador p")
    , @NamedQuery(name = "PerfilJugador.findById", query = "SELECT p FROM PerfilJugador p WHERE p.id = :id")
    , @NamedQuery(name = "PerfilJugador.findByNombre", query = "SELECT p FROM PerfilJugador p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "PerfilJugador.findByCorreo", query = "SELECT p FROM PerfilJugador p WHERE p.correo = :correo")
    , @NamedQuery(name = "PerfilJugador.findByHabilidad", query = "SELECT p FROM PerfilJugador p WHERE p.habilidad = :habilidad")})
public class PerfilJugador implements Serializable {

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
    @Size(min = 1, max = 80)
    @Column(name = "correo")
    private String correo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "habilidad")
    private String habilidad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPerfil")
    private List<Equipo> equipoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idJugador")
    private List<Incripcion> incripcionList;
    @JoinColumn(name = "id_tipo_jugador", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TipoJugador idTipoJugador;
    @JoinColumn(name = "id_usuario", referencedColumnName = "usuario")
    @ManyToOne(optional = false)
    private Usuario idUsuario;

    public PerfilJugador() {
    }

    public PerfilJugador(Integer id) {
        this.id = id;
    }

    public PerfilJugador(Integer id, String nombre, String correo, String habilidad) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.habilidad = habilidad;
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getHabilidad() {
        return habilidad;
    }

    public void setHabilidad(String habilidad) {
        this.habilidad = habilidad;
    }

    @XmlTransient
    public List<Equipo> getEquipoList() {
        return equipoList;
    }

    public void setEquipoList(List<Equipo> equipoList) {
        this.equipoList = equipoList;
    }

    @XmlTransient
    public List<Incripcion> getIncripcionList() {
        return incripcionList;
    }

    public void setIncripcionList(List<Incripcion> incripcionList) {
        this.incripcionList = incripcionList;
    }

    public TipoJugador getIdTipoJugador() {
        return idTipoJugador;
    }

    public void setIdTipoJugador(TipoJugador idTipoJugador) {
        this.idTipoJugador = idTipoJugador;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
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
        if (!(object instanceof PerfilJugador)) {
            return false;
        }
        PerfilJugador other = (PerfilJugador) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.PerfilJugador[ id=" + id + " ]";
    }
    
}
