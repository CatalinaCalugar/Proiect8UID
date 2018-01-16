package com.spr.controller;

import com.spr.exception.ContractNotFound;
import com.spr.model.Contract;
import com.spr.validation.ContractValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Catalina on 5/10/2017.
 */
@Controller
@RequestMapping(value = "/contract")
public class ContractController {

    @Autowired
    private ContractValidator contractValidator;
    private int contractId;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(contractValidator);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newContractPage() {
        ModelAndView mav = new ModelAndView("contract-new", "contract", new Contract());
//        List<Adoption> adoptionList = adoptionService.findAllWithoutContract();
//        mav.addObject("adoptionList", adoptionList);
//        List<Client> clientList = clientService.findAll();
//        mav.addObject("clientList", clientList);
//        List<Integer> adId = new ArrayList<>();
//        for (Adoption a : adoptionList) {
//            adId.add(a.getId());
//        }
        mav.addObject("adoptionId", 1);
        return mav;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView createNewContract(@ModelAttribute @Valid Contract contract, HttpServletResponse response,
                                          BindingResult result, @RequestParam("type") Integer id,
                                          final RedirectAttributes redirectAttributes, HttpSession session) {

        if (result.hasErrors())
            return new ModelAndView("contract-new");

        ModelAndView mav = new ModelAndView();
        String message = "New contract " + contract.getId() + " was successfully created.";

//       Contract check = contractService.create(contract);
//        if (check == null)
//            message = "FAIL: Contract already exists!";
//        else {
//            Adoption ad = adoptionService.findById(id);
//            ad.setIdUser(((User) session.getAttribute("loggedUser")).getId());
//            ad.setIdContract(check.getId());
//            contractId = ad.getIdContract();
//            adoptionService.update(ad);
//            Client cl = clientService.findById(ad.getIdClient());
//            Pet adoptedPet = petService.findById(ad.getIdPet());
//            adoptedPet.setAvailable(false);
//            petService.update(adoptedPet);
//            Report r = new PdfReport();
//            r.generate(contract, ad, cl, adoptedPet.getPrice());
//        }
        mav.setViewName("contract-download");

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView contractListPage() {
        ModelAndView mav = new ModelAndView("contract-list");
        List<Contract> contractList = new ArrayList<>();

        mav.addObject("contractList", contractList);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editContractPage(@PathVariable Integer id) {
        ModelAndView mav = new ModelAndView("contract-edit");

        Contract contract = new Contract();
        mav.addObject("contract", contract);
        return mav;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView editContract(@ModelAttribute @Valid Contract contract,
                                     BindingResult result,
                                     @PathVariable Integer id,
                                     final RedirectAttributes redirectAttributes, HttpSession session) throws ContractNotFound {

        if (result.hasErrors())
            return new ModelAndView("contract-edit");

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");
        String message = "Contract was successfully updated.";


        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public ModelAndView deleteContract(@PathVariable Integer id,
                                       final RedirectAttributes redirectAttributes, HttpSession session) throws ContractNotFound {

        ModelAndView mav = new ModelAndView("redirect:/user-page.html");

        String message = "The contract " + id + " was successfully deleted.";

        redirectAttributes.addFlashAttribute("message", message);
        return mav;
    }

    @RequestMapping(value = "/download/{contracttype}", method = RequestMethod.GET)
    public void downloadFile(HttpServletResponse response) throws IOException {
        String path = new File(".").getAbsolutePath();

        String EXTERNAL_FILE_PATH = path + "Contract" + contractId + ".pdf";
        File file = null;

        file = new File(EXTERNAL_FILE_PATH);

        if (!file.exists()) {
            String errorMessage = "Sorry. The file you are looking for does not exist";
            System.out.println(errorMessage);
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
            outputStream.close();
            return;
        }

        String mimeType = URLConnection.guessContentTypeFromName(file.getName());
        if (mimeType == null) {
            System.out.println("mimetype is not detectable, will take default");
            mimeType = "application/octet-stream";
        }

        System.out.println("mimetype : " + mimeType);

        response.setContentType(mimeType);

        /* "Content-Disposition : inline" will show viewable types [like images/text/pdf/anything viewable by browser] right on browser
            while others(zip e.g) will be directly downloaded [may provide save as popup, based on your browser setting.]*/
        response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));


        /* "Content-Disposition : attachment" will be directly download, may provide save as popup, based on your browser setting*/
        //response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));

        response.setContentLength((int) file.length());

        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

        //Copy bytes from source to destination(outputstream in this example), closes both streams.
        FileCopyUtils.copy(inputStream, response.getOutputStream());
    }
}
