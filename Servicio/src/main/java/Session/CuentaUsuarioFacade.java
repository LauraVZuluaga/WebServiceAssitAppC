/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.CuentaUsuario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Usuario
 */
@Stateless
public class CuentaUsuarioFacade extends AbstractFacade<CuentaUsuario> {

    @PersistenceContext(unitName = "com.ingelaj_Servicio_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CuentaUsuarioFacade() {
        super(CuentaUsuario.class);
    }
    
}
