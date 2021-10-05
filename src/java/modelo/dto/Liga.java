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
@Table(name = "liga")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Liga.findAll", query = "SELECT l FROM Liga l")
    , @NamedQuery(name = "Liga.findById", query = "SELECT l FROM Liga l WHERE l.id = :id")
    , @NamedQuery(name = "Liga.findByDescripcion", query = "SELECT l FROM Liga l WHERE l.descripcion = :descripcion")
    , @NamedQuery(name = "Liga.findByCantidadEquipo", query = "SELECT l FROM Liga l WHERE l.cantidadEquipo = :cantidadEquipo")})
public class Liga implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad_equipo")
    private int cantidadEquipo;
    @JoinColumn(name = "id_juego", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private VideoJuego idJuego;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idLiga")
    private List<Equipo> equipoList;

    public Liga() {
    }

    public Liga(Integer id) {
        this.id = id;
    }

    public Liga(Integer id, String descripcion, int cantidadEquipo) {
        this.id = id;
        this.descripcion = descripcion;
        this.cantidadEquipo = cantidadEquipo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidadEquipo() {
        return cantidadEquipo;
    }

    public void setCantidadEquipo(int cantidadEquipo) {
        this.cantidadEquipo = cantidadEquipo;
    }

    public VideoJuego getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(VideoJuego idJuego) {
        this.idJuego = idJuego;
    }

    @XmlTransient
    public List<Equipo> getEquipoList() {
        return equipoList;
    }

    public void setEquipoList(List<Equipo> equipoList) {
        this.equipoList = equipoList;
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
        if (!(object instanceof Liga)) {
            return false;
        }
        Liga other = (Liga) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Liga[ id=" + id + " ]";
    }
    
}
