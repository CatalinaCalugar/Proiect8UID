package com.spr.service;

import com.spr.exception.ClientNotFound;
import com.spr.model.Client;

import java.util.List;

/**
 * Created by Catalina on 24.03.2017.
 */
public interface ClientService {
    public Client create(Client client);
    public Client delete(int id) throws ClientNotFound;
    public List<Client> findAll();
    public Client update(Client Client) throws ClientNotFound;
    public Client findById(int id);
    public Client findByUsername(String username);
}
