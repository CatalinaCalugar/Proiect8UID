package com.spr.utils;

import com.spr.model.CoworkingSpace;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Paula on 1/8/2018.
 */
public class InitialSpacesFactory {
    private List<CoworkingSpace> coworkingSpaces;

    public InitialSpacesFactory() {
        coworkingSpaces = initializeCoworkingSpaces();
    }

    private List<CoworkingSpace> initializeCoworkingSpaces() {
        CoworkingSpace c1 = new CoworkingSpace();
        CoworkingSpace c2 = new CoworkingSpace();
        CoworkingSpace c3 = new CoworkingSpace();
        CoworkingSpace c4 = new CoworkingSpace();
        CoworkingSpace c5 = new CoworkingSpace();
        CoworkingSpace c6 = new CoworkingSpace();
        CoworkingSpace c7 = new CoworkingSpace();
        CoworkingSpace c8 = new CoworkingSpace();
        CoworkingSpace c9 = new CoworkingSpace();

        c1.setDescription("bllla1");
        c2.setDescription("bllla2");
        c3.setDescription("bllla3");
        c4.setDescription("bllla4");
        c5.setDescription("bllla5");
        c6.setDescription("bllla6");
        c7.setDescription("bllla7");
        c8.setDescription("bllla8");
        c9.setDescription("bllla9");

        c1.setName("space 1");
        c2.setName("space 2");
        c3.setName("space 3");
        c4.setName("space 4");
        c5.setName("space 5");
        c6.setName("space 6");
        c7.setName("space 7");
        c8.setName("space 8");
        c9.setName("space 9");

        List<CoworkingSpace> coworkingSpaces = new ArrayList<>();
        coworkingSpaces.add(c1);
        coworkingSpaces.add(c2);
        coworkingSpaces.add(c3);
        coworkingSpaces.add(c4);
        coworkingSpaces.add(c5);
        coworkingSpaces.add(c6);
        coworkingSpaces.add(c7);
        coworkingSpaces.add(c8);
        coworkingSpaces.add(c9);
        return coworkingSpaces;

    }

    public List<CoworkingSpace> getCoworkingSpaces() {
        return coworkingSpaces;
    }

    public void setCoworkingSpaces(List<CoworkingSpace> coworkingSpaces) {
        this.coworkingSpaces = coworkingSpaces;
    }
}
