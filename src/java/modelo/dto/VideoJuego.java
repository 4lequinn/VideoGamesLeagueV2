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
@Table(name = "video_juego")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VideoJuego.findAll", query = "SELECT v FROM VideoJuego v")
    , @NamedQuery(name = "VideoJuego.findById", query = "SELECT v FROM VideoJuego v WHERE v.id = :id")
    , @NamedQuery(name = "VideoJuego.findByNombre", query = "SELECT v FROM VideoJuego v WHERE v.nombre = :nombre")
    , @NamedQuery(name = "VideoJuego.findByTipoJuego", query = "SELECT v FROM VideoJuego v WHERE v.tipoJuego = :tipoJuego")})
public class VideoJuego implements Serializable {

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
    @Column(name = "tipo_juego")
    private String tipoJuego;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idJuego")
    private List<Liga> ligaList;

    public VideoJuego() {
    }

    public VideoJuego(Integer id) {
        this.id = id;
    }

    public VideoJuego(Integer id, String nombre, String tipoJuego) {
        this.id = id;
        this.nombre = nombre;
        this.tipoJuego = tipoJuego;
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

    public String getTipoJuego() {
        return tipoJuego;
    }

    public void setTipoJuego(String tipoJuego) {
        this.tipoJuego = tipoJuego;
    }

    @XmlTransient
    public List<Liga> getLigaList() {
        return ligaList;
    }

    public void setLigaList(List<Liga> ligaList) {
        this.ligaList = ligaList;
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
        if (!(object instanceof VideoJuego)) {
            return false;
        }
        VideoJuego other = (VideoJuego) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.VideoJuego[ id=" + id + " ]";
    }
    
}
