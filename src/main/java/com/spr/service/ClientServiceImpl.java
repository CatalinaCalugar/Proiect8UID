package com.spr.service;

import com.spr.exception.ClientNotFound;
import com.spr.model.Client;
import com.spr.model.Client;
import com.spr.repository.ClientRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Catalina on 24.03.2017.
 */
@Service
public class ClientServiceImpl implements ClientService {

    @Resource
    private ClientRepository clientRepository;

    @Override
    @Transactional
    public Client create(Client client) {
        Client createdClient = client;
        List<Client> clList = clientRepository.findAll();
        for (Client a : clList) {
            if (a.getCNP().equals(client.getCNP()) || a.getUsername().equals(client.getUsername())) {
                return null;
            }
        }
        return clientRepository.save(client);
    }

    @Override
    @Transactional
    public Client delete(int id) throws ClientNotFound {
        Client deletedClient = clientRepository.findOne(id);
        if (deletedClient == null) {
            throw new ClientNotFound();
        }
        clientRepository.delete(deletedClient);
        return deletedClient;
    }

    @Override
    @Transactional
    public List<Client> findAll() {
        return clientRepository.findAll();
    }

    @Override
    @Transactional
    public Client update(Client client) throws ClientNotFound {
        Client updatedClient = clientRepository.findOne(client.getId());
        if (updatedClient == null)
            throw new ClientNotFound();
        updatedClient.setFname(client.getFname());
        updatedClient.setLname(client.getLname());
        updatedClient.setAddress(client.getAddress());
        updatedClient.setEmail(client.getEmail());
        updatedClient.setCNP(client.getCNP());
        updatedClient.setPassword(client.getPassword());
        updatedClient.setUsername(client.getUsername());
        return updatedClient;
    }

    @Override
    @Transactional
    public Client findById(int id) {
        return clientRepository.findOne(id);
    }

    @Override
    @Transactional
    public Client findByUsername(String username) {
        List<Client> clientList = findAll();
        for (Client c : clientList) {
            if (c.getUsername().equals(username))
                return c;
        }
        return null;
    }
}
