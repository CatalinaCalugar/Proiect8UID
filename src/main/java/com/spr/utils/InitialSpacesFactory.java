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

        List<String> amenitiesList = new ArrayList<>();
        amenitiesList.add("computers");
        amenitiesList.add("projectors");
        amenitiesList.add("white board");
        amenitiesList.add("markers");

        c1.setId(1);
        c2.setId(2);
        c3.setId(3);
        c4.setId(4);
        c5.setId(5);
        c6.setId(6);
        c7.setId(7);
        c8.setId(8);
        c9.setId(9);

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

        c1.setOwnerEmail("owner1@gmail.com");
        c2.setOwnerEmail("owner1@gmail.com");
        c3.setOwnerEmail("owner1@gmail.com");
        c4.setOwnerEmail("owner1@gmail.com");
        c5.setOwnerEmail("owner1@gmail.com");
        c6.setOwnerEmail("owner1@gmail.com");
        c7.setOwnerEmail("owner1@gmail.com");
        c8.setOwnerEmail("owner1@gmail.com");
        c9.setOwnerEmail("owner1@gmail.com");

        c1.setOwnerPhone("0756843701");
        c2.setOwnerPhone("0756843702");
        c3.setOwnerPhone("0756843703");
        c4.setOwnerPhone("0756843704");
        c5.setOwnerPhone("0756843705");
        c6.setOwnerPhone("0756843706");
        c7.setOwnerPhone("0756843707");
        c8.setOwnerPhone("0756843708");
        c9.setOwnerPhone("0756843709");

        c1.setWebURL("www.space1.com");
        c2.setWebURL("www.space2.com");
        c3.setWebURL("www.space3.com");
        c4.setWebURL("www.space4.com");
        c5.setWebURL("www.space5.com");
        c6.setWebURL("www.space6.com");
        c7.setWebURL("www.space7.com");
        c8.setWebURL("www.space8.com");
        c9.setWebURL("www.space9.com");

        c1.setWebURL("www.facebook.com/space1");
        c2.setWebURL("www.facebook.com/space2");
        c3.setWebURL("www.facebook.com/space3");
        c4.setWebURL("www.facebook.com/space4");
        c5.setWebURL("www.facebook.com/space5");
        c6.setWebURL("www.facebook.com/space6");
        c7.setWebURL("www.facebook.com/space7");
        c8.setWebURL("www.facebook.com/space8");
        c9.setWebURL("www.facebook.com/space9");

        c1.setWebURL("www.twitter.com/space1");
        c2.setWebURL("www.twitter.com/space2");
        c3.setWebURL("www.twitter.com/space3");
        c4.setWebURL("www.twitter.com/space4");
        c5.setWebURL("www.twitter.com/space5");
        c6.setWebURL("www.twitter.com/space6");
        c7.setWebURL("www.twitter.com/space7");
        c8.setWebURL("www.twitter.com/space8");
        c9.setWebURL("www.twitter.com/space9");

        c1.setGeneralAmenities(amenitiesList);
        c2.setGeneralAmenities(amenitiesList);
        c3.setGeneralAmenities(amenitiesList);
        c4.setGeneralAmenities(amenitiesList);
        c5.setGeneralAmenities(amenitiesList);
        c6.setGeneralAmenities(amenitiesList);
        c7.setGeneralAmenities(amenitiesList);
        c8.setGeneralAmenities(amenitiesList);
        c9.setGeneralAmenities(amenitiesList);

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

    public List<CoworkingSpace> getFirstNSpaces(int n) {

        if (n >= coworkingSpaces.size()) {
            return coworkingSpaces;
        }

        List<CoworkingSpace> firstSpaces = new ArrayList<>();

        for (int i = 0; i < coworkingSpaces.size(); i++) {
            firstSpaces.add(coworkingSpaces.get(i));
        }

        return firstSpaces;
    }

    public CoworkingSpace getSpaceByID(int id){
        return coworkingSpaces.get(id);
    }
}
