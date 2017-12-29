package com.spr.utils;


import com.spr.model.Adoption;
import com.spr.model.Client;
import com.spr.model.Contract;

/**
 * Created by Catalina on 14.04.2017.
 */
public interface Report {
    public void generate(Contract contract, Adoption adoption, Client client, Float total);
}
