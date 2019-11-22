/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ingelaj.consultar;

import com.google.gson.Gson;
import com.ingelaj.bd.entidades.Servicio;
import com.ingelaj.bd.servicio.ServicioService;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * REST Web Service
 *
 * @author Usuario
 */
@Path("servicio")
public class ServicioResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ServicioResource
     */
    public ServicioResource() {
    }

    /**
     * Retrieves representation of an instance of com.ingelaj.consultar.ServicioResource
     * @return an instance of java.lang.String
     */
    @GET
    @Path("all")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getJson() {
        
        try{
            List<Servicio> servicios = new ServicioService().getAll();
            String json = new Gson().toJson(servicios);
            return Response.ok(json, MediaType.APPLICATION_JSON).build();
        }
        catch(Exception ex){
            return Response.status(Response.Status.SEE_OTHER).entity("Error: " + ex.toString()).build();
        }
    }
    /**
     * PUT method for updating or creating an instance of ServicioResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
