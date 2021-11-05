/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jorge
 */
@Entity
@Table(name = "detalle_partido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetallePartido.findAll", query = "SELECT d FROM DetallePartido d")
    , @NamedQuery(name = "DetallePartido.findById", query = "SELECT d FROM DetallePartido d WHERE d.id = :id")})
public class DetallePartido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "id_equipo", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Equipo idEquipo;
    @JoinColumn(name = "id_resultado", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Resultado idResultado;
    @JoinColumn(name = "id_partido", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Partido idPartido;

    public DetallePartido() {
    }

    public DetallePartido(Integer id) {
        this.id = id;
    }

    public DetallePartido(Equipo idEquipo, Resultado idResultado, Partido idPartido) {
        this.idEquipo = idEquipo;
        this.idResultado = idResultado;
        this.idPartido = idPartido;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Equipo getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(Equipo idEquipo) {
        this.idEquipo = idEquipo;
    }

    public Resultado getIdResultado() {
        return idResultado;
    }

    public void setIdResultado(Resultado idResultado) {
        this.idResultado = idResultado;
    }

    public Partido getIdPartido() {
        return idPartido;
    }

    public void setIdPartido(Partido idPartido) {
        this.idPartido = idPartido;
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
        if (!(object instanceof DetallePartido)) {
            return false;
        }
        DetallePartido other = (DetallePartido) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.DetallePartido[ id=" + id + " ]";
    }

}
