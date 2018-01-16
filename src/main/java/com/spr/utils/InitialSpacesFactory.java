package com.spr.utils;

import com.spr.model.CoworkingSpace;
import com.spr.model.Office;

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

        List<String> generalPhotos = new ArrayList<>();
        generalPhotos.add("genSp1.jpg");
        generalPhotos.add("genSp2.jpg");

        List<Office> officesList = new ArrayList<>();
        officesList.add(new Office(1, "POffice1", "private office", 7, "office1.jpg", amenitiesList, 80.0));
        officesList.add(new Office(2, "OOffice2", "open space", 40, "office2.jpg", amenitiesList, 10.0));
        officesList.add(new Office(3, "POffice3", "private office", 5, "office3.jpg", amenitiesList, 60.0));
        officesList.add(new Office(4, "OOffice4", "open space", 30, "office4.jpg", amenitiesList, 15.0));

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

        c1.setFacebookUrl("www.facebook.com/space1");
        c2.setFacebookUrl("www.facebook.com/space2");
        c3.setFacebookUrl("www.facebook.com/space3");
        c4.setFacebookUrl("www.facebook.com/space4");
        c5.setFacebookUrl("www.facebook.com/space5");
        c6.setFacebookUrl("www.facebook.com/space6");
        c7.setFacebookUrl("www.facebook.com/space7");
        c8.setFacebookUrl("www.facebook.com/space8");
        c9.setFacebookUrl("www.facebook.com/space9");

        c1.setTwitterUrl("www.twitter.com/space1");
        c2.setTwitterUrl("www.twitter.com/space2");
        c3.setTwitterUrl("www.twitter.com/space3");
        c4.setTwitterUrl("www.twitter.com/space4");
        c5.setTwitterUrl("www.twitter.com/space5");
        c6.setTwitterUrl("www.twitter.com/space6");
        c7.setTwitterUrl("www.twitter.com/space7");
        c8.setTwitterUrl("www.twitter.com/space8");
        c9.setTwitterUrl("www.twitter.com/space9");

        c1.setOpeningHour("09:00");
        c2.setOpeningHour("10:00");
        c3.setOpeningHour("08:00");
        c4.setOpeningHour("11:00");
        c5.setOpeningHour("07:00");
        c6.setOpeningHour("09:00");
        c7.setOpeningHour("10:00");
        c8.setOpeningHour("10:00");
        c9.setOpeningHour("09:00");

        c1.setClosingHour("20:00");
        c2.setClosingHour("21:00");
        c3.setClosingHour("22:00");
        c4.setClosingHour("23:00");
        c5.setClosingHour("24:00");
        c6.setClosingHour("21:00");
        c7.setClosingHour("20:00");
        c8.setClosingHour("22:00");
        c9.setClosingHour("20:00");

        c1.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c2.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c3.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c4.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c5.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c6.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c7.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c8.setISBN("RO33 0006 1005 1978 6457 8413 26");
        c9.setISBN("RO33 0006 1005 1978 6457 8413 26");

        c1.setLongitude("23.591423");
        c2.setLongitude("23.591423");
        c3.setLongitude("23.591423");
        c4.setLongitude("23.591423");
        c5.setLongitude("23.591423");
        c6.setLongitude("23.591423");
        c7.setLongitude("23.591423");
        c8.setLongitude("23.591423");
        c9.setLongitude("23.591423");

        c1.setLatitude("46.770439");
        c2.setLatitude("46.770439");
        c3.setLatitude("46.770439");
        c4.setLatitude("46.770439");
        c5.setLatitude("46.770439");
        c6.setLatitude("46.770439");
        c7.setLatitude("46.770439");
        c8.setLatitude("46.770439");
        c9.setLatitude("46.770439");

        c1.setGeneralAmenities(amenitiesList);
        c2.setGeneralAmenities(amenitiesList);
        c3.setGeneralAmenities(amenitiesList);
        c4.setGeneralAmenities(amenitiesList);
        c5.setGeneralAmenities(amenitiesList);
        c6.setGeneralAmenities(amenitiesList);
        c7.setGeneralAmenities(amenitiesList);
        c8.setGeneralAmenities(amenitiesList);
        c9.setGeneralAmenities(amenitiesList);

        c1.setGeneralPhotos(generalPhotos);
        c2.setGeneralPhotos(generalPhotos);
        c3.setGeneralPhotos(generalPhotos);
        c4.setGeneralPhotos(generalPhotos);
        c5.setGeneralPhotos(generalPhotos);
        c6.setGeneralPhotos(generalPhotos);
        c7.setGeneralPhotos(generalPhotos);
        c8.setGeneralPhotos(generalPhotos);
        c9.setGeneralPhotos(generalPhotos);

        c1.setOfficeList(officesList);
        c2.setOfficeList(officesList);
        c3.setOfficeList(officesList);
        c4.setOfficeList(officesList);
        c5.setOfficeList(officesList);
        c6.setOfficeList(officesList);
        c7.setOfficeList(officesList);
        c8.setOfficeList(officesList);
        c9.setOfficeList(officesList);

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

    public CoworkingSpace getSpaceByID(int id) {
        return coworkingSpaces.get(id);
    }
}
