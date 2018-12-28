/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.pojos.DivisionalSecretariat;
import com.pojos.Guardian;
import com.pojos.NeedyPerson;
import com.pojos.PrivateRecord;
import com.pojos.PrivateRecordHasNeedyPerson;
import com.pojos.Role;
import com.pojos.User;
import com.service.NeedyService;
import static com.additional.ValidateRecords.checkBloodGroup;
import static com.additional.ValidateRecords.checkEducationalLevel;
import static com.additional.ValidateRecords.checkGender;
import static com.additional.ValidateRecords.checkMartialStatus;
import com.pojos.DeathDetail;
import com.pojos.DeathDetailId;
import com.pojos.NeedyPersonHasGuardian;
import com.service.SettingService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rajitha
 */
@Controller
public class NeedyController {

    @Autowired
    private NeedyService needyService;

    @Autowired
    private SettingService settingService;

    @RequestMapping(value = "/newneedy1", method = RequestMethod.GET)
    public ModelAndView displayForm() {
        ModelAndView modelAndView = new ModelAndView("new_needy1");
        String receiveCode = this.needyService.receiveCode();
        modelAndView.addObject("needycode", receiveCode);
        return modelAndView;
    }

    @RequestMapping(value = "/newneedy3", method = RequestMethod.GET)

    public ModelAndView displayForm3(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request, Model model) throws ParseException {

        String ad1 = reqPar.get("ad1");
        String ad2 = reqPar.get("ad2");
        String city = reqPar.get("city");
        String postal = reqPar.get("postal");
        String mob = reqPar.get("mobile");
        String em = reqPar.get("email");

        NeedyPerson needyPerson = (NeedyPerson) httpSession.getAttribute("needyperson");
        needyPerson.setAddressLine1(ad1);
        needyPerson.setAddressLine2(ad2);
        needyPerson.setCity(city);
        needyPerson.setPostalCode(postal);
        needyPerson.setMobile(mob);
        needyPerson.setEmail(em);
        return new ModelAndView("new_needy3", "guardian", new Guardian());
    }

    @RequestMapping(value = "/newneedy2")
    @DateTimeFormat(pattern = "YYYY-MM-dd")
    public String submitNeedyRegistrationForm(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request, Model model) throws ParseException {

        String code = reqPar.get("code");
        String firstname = reqPar.get("firstname");
        String lastname = reqPar.get("lastname");
        String fullname = reqPar.get("fullname");
        String nic = reqPar.get("nic");
        String dob = reqPar.get("dob");
        String gender = reqPar.get("gender");
        String bloodgroup = request.getParameter("bloodgroup");
        String martialstatus = request.getParameter("martialstatus");
        String ds = request.getParameter("ds");
        String edulevel = request.getParameter("edulevel");
        String[] cat = request.getParameterValues("cat");
        String[] subcat = request.getParameterValues("subcat");
        String[] from = request.getParameterValues("from");
        String[] to = request.getParameterValues("to");
        String deathday = reqPar.get("deathday");
        String reason = reqPar.get("reason");
        String location = reqPar.get("location");
        String comment = reqPar.get("comment");
        String boo = reqPar.get("booleandeath");
        String bgval, mstatus, edulvl = null;

        //check bloodgrp
        bgval = checkBloodGroup(bloodgroup);

        //check martailstatus
        mstatus = checkMartialStatus(martialstatus);
        //check edulevel;
        edulvl = checkEducationalLevel(edulevel);

        NeedyPerson needyPerson = new NeedyPerson();
        needyPerson.setId((int) this.needyService.receiveId());
        needyPerson.setCode(code);
        needyPerson.setFirstName(firstname);
        needyPerson.setLastName(lastname);
        needyPerson.setFullName(fullname);
        needyPerson.setNic(nic);
        needyPerson.setGender(gender);

        needyPerson.setBloodGroup(bgval);
        needyPerson.setMartialStatus(mstatus);
        needyPerson.setEducationalLevel(edulvl);

        System.out.println("@@@@" + boo);
        //set dob
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String[] split = null;
        if (!dob.equals(null)) {
            split = dob.split("/");
            dob = split[2] + "-" + split[1] + "-" + split[0];

            Date birth = df.parse(dob);
            needyPerson.setDob(birth);
        }
        //set death
        String[] split2 = null;
        Set<DeathDetail> dds;
        if (deathday != null || boo != null) {
            split2 = deathday.split("/");
            deathday = split2[2] + "-" + split2[1] + "-" + split2[0];
            Date death = df.parse(deathday);

            DeathDetail deathDetail = new DeathDetail();
            DeathDetailId ddi = new DeathDetailId();
            ddi.setId((int) this.needyService.searchDeathRecords());

            deathDetail.setId(ddi);
            deathDetail.setComment(comment);
            deathDetail.setDeathDate(death);
            deathDetail.setLocation(location);
            deathDetail.setReason(reason);
            deathDetail.setNeedyPerson(needyPerson);

            dds = new HashSet<>();
            dds.add(deathDetail);
            needyPerson.setDeathDetails(dds);

        }

        //set ds
        DivisionalSecretariat divisionalSecretariat = needyService.receiveNeedyDS(ds);
        needyPerson.setDivisionalSecretariat(divisionalSecretariat);

        String val, subval;
        PrivateRecord pr;

        PrivateRecordHasNeedyPerson prhnp;

        Set<PrivateRecordHasNeedyPerson> privateRecordHasNeedyPersons = new HashSet<>();

        for (int i = 0; i < cat.length; i++) {
            val = cat[i];
            subval = subcat[i];

            //receive the object vlaue of pvt record
            pr = needyService.serachDisability(val, subval);

            prhnp = new PrivateRecordHasNeedyPerson();

            // prhnp.setId((int) needyService.searchNeedyhasPvtRecord());
            prhnp.setNeedyPerson(needyPerson);
            prhnp.setPrivateRecord(pr);
            prhnp.setStartingYear(Integer.valueOf(from[i]));
            prhnp.setEndingYear(Integer.valueOf(to[i]));
            prhnp.setStatus("A");

            privateRecordHasNeedyPersons.add(prhnp);

        }

        needyPerson.setPrivateRecordHasNeedyPersons(privateRecordHasNeedyPersons);

        //set Role
        Role receiveNeedyRole = this.needyService.receiveNeedyRole();
        needyPerson.setRole(receiveNeedyRole);
        //setUser
        User u = (User) httpSession.getAttribute("LOGGEDIN_USER");
        if (u != null) {
            needyPerson.setUser(u);
        }

        httpSession.setAttribute("needyperson", needyPerson);
        //httpSession.setAttribute("deathdetails", deathDetail);
        //httpSession.setAttribute("needydisability", privateRecordHasNeedyPersons);

        return "new_needy2";

    }

    @RequestMapping(value = "/registerneedy2", method = RequestMethod.POST)
    public String submitNeedyRegistrationForm2(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request) throws ParseException {

        String ad1 = reqPar.get("ad1");
        String ad2 = reqPar.get("ad2");
        String city = reqPar.get("city");
        String postal = reqPar.get("postal");
        String mob = reqPar.get("mobile");
        String em = reqPar.get("email");

        NeedyPerson needyPerson = (NeedyPerson) httpSession.getAttribute("needyperson");
        needyPerson.setAddressLine1(ad1);
        needyPerson.setAddressLine2(ad2);
        needyPerson.setCity(city);
        needyPerson.setPostalCode(postal);
        needyPerson.setMobile(mob);
        needyPerson.setEmail(em);
        //DeathDetail deathDetail = (DeathDetail) httpSession.getAttribute("deathdetails");
        // Set<PrivateRecordHasNeedyPerson> records = (Set<PrivateRecordHasNeedyPerson>) httpSession.getAttribute("needydisability")

        this.needyService.saveNeeyPersonRecords(needyPerson);

        return "adminhome.htm";
    }

    @RequestMapping(value = "/registerneedy3", method = RequestMethod.POST)
    public String submitNeedyRegistrationForm3(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request) throws ParseException {
        //final registration
        String gtype = reqPar.get("gtype");
        String gfrom = reqPar.get("gfrom");
        String gto = reqPar.get("gto");
        String fname = reqPar.get("firstname");
        String lname = reqPar.get("lastname");
        String gender = reqPar.get("gender");
        String nic = reqPar.get("nic");
        String ad1 = reqPar.get("adr1");
        String ad2 = reqPar.get("adr2");
        String city = reqPar.get("city");
        String postal = reqPar.get("postal");
        String mob = reqPar.get("mobile");
        String em = reqPar.get("email");

        NeedyPerson needyPerson = (NeedyPerson) httpSession.getAttribute("needyperson");
        Guardian guardian = new Guardian();
        guardian.setId((int) this.needyService.receiveGuardianId());
        guardian.setAddressLine1(ad1);
        guardian.setAddressLine2(ad2);
        guardian.setCity(city);
        guardian.setEmail(em);
        guardian.setFirstName(fname);
        guardian.setGender(gender);
        guardian.setLastName(lname);
        guardian.setMobile(mob);
        guardian.setNic(nic);
        guardian.setPostalCode(postal);
        guardian.setNic(nic);
        guardian.setRelationship(gtype);

        Set<NeedyPersonHasGuardian> personHasGuardians = new HashSet<>();
        //setId
        NeedyPersonHasGuardian hasGuardian = new NeedyPersonHasGuardian();
        hasGuardian.setNeedyPerson(needyPerson);
        hasGuardian.setGuardian(guardian);
        hasGuardian.setStartingYear(Integer.parseInt(gfrom));
        hasGuardian.setEndingYear(Integer.parseInt(gto));

        personHasGuardians.add(hasGuardian);
        guardian.setNeedyPersonHasGuardians(personHasGuardians);

        this.needyService.saveNeeyPersonRecords2(needyPerson, guardian);

        return "adminhome";

    }

    @RequestMapping(value = "/searchneedy", method = RequestMethod.GET)

    public ModelAndView displaySearchData() {
        ModelAndView modelAndView = new ModelAndView("search_needy");
        return modelAndView;
    }

    @RequestMapping(value = "/viewneedy", method = RequestMethod.GET)

    public ModelAndView displayProfile() {
        ModelAndView modelAndView = new ModelAndView("view_needy");
        return modelAndView;
    }

    @RequestMapping(value = "/needysignup", method = RequestMethod.GET)

    public ModelAndView displaySignUp() {
        ModelAndView modelAndView = new ModelAndView("needy_registration");
        return modelAndView;
    }

    @RequestMapping(value = "/adddisability")
    @ResponseBody
    public String addDisability() {

        String displayDisability = needyService.displayDisability();
        return displayDisability;

    }

    @RequestMapping(value = "/adddisabilitysub")
    @ResponseBody
    public String addSubDisability(@RequestParam String cat) {

        String displayDisability = needyService.displaySubDisability(cat);
        return displayDisability;

    }

    @RequestMapping(value = "/addds")
    @ResponseBody
    public String addDS() {

        String displayDS = needyService.displayDS();
        return displayDS;
    }

    @RequestMapping(value = "/skill")
    @ResponseBody
    public String addSkill() {

        String displaySkill = needyService.displaySkill();
        return displaySkill;

    }

    @RequestMapping(value = "/searchNeedy", method = RequestMethod.GET)
    public String SearchNeedy(HttpSession httpSession, @RequestParam Map<String, String> reqPar, HttpServletRequest request, ModelMap map) throws ParseException {
        String key = reqPar.get("keyword");
        String category = reqPar.get("category");

        List<NeedyPerson> searchNeedyPerson = this.needyService.searchNeedyPerson(key, category);
        map.addAttribute("needyList", searchNeedyPerson);
        //ModelAndView mav=new ModelAndVie
        //mav.addObject(searchNeedyPerson);
        return "view_needy";
    }

    @RequestMapping(value = "/advancedsearch", method = RequestMethod.GET)
    public String doAdvancedSearch() {
        return "advanced_search";
    }

    //updateneedycontact.htm
    @RequestMapping(value = "/guardianprofile.htm", method = RequestMethod.GET)
    public ModelAndView guardianProfile(HttpServletRequest request, @RequestParam String code, @RequestParam String gid, @RequestParam String gval) {
        ModelAndView mav = new ModelAndView("guardian_profile");
        Guardian g = this.needyService.searcgGuardian(Integer.parseInt(gid));
        NeedyPerson np = this.needyService.receiveCode(code);

        Set<NeedyPersonHasGuardian> needyPersonHasGuardians = np.getNeedyPersonHasGuardians();
        Guardian temp;
        for (NeedyPersonHasGuardian nphg : needyPersonHasGuardians) {
            temp = nphg.getGuardian();
            if (temp.getId() == g.getId()) {
                mav.addObject("needygur", nphg);
                break;
            }
        }
        mav.addObject("gur", g);
        return mav;
    }

    @RequestMapping(value = "/updateguardianprofile", method = RequestMethod.POST)
    public String updateNeedyGuardianProfile(HttpServletRequest request, @RequestParam(value = "tolevel", required = false) String toVal) {
        String gid = request.getParameter("gid");
        String nid = request.getParameter("needycode");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String addressLine1 = request.getParameter("addresss1");
        String addressLine2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String postalcode = request.getParameter("postalcode");
        String mobile = request.getParameter("mobile");
        boolean boo = (fname.length() == 0 || lname.length() == 0 || addressLine1.length() == 0 || city.length() == 0 || postalcode.length() == 0);
        NeedyPerson np = this.needyService.receiveCode(nid);
        Set<NeedyPersonHasGuardian> needyPersonHasGuardians = np.getNeedyPersonHasGuardians();
        Guardian temp;
        NeedyPersonHasGuardian ncheck=null;
        if (boo == false) {

            Guardian g = this.needyService.searcgGuardian(Integer.parseInt(gid));
            g.setFirstName(fname);
            g.setLastName(lname);
            g.setAddressLine1(addressLine1);
            g.setAddressLine2(addressLine2);
            g.setCity(city);
            g.setPostalCode(postalcode);
            g.setMobile(mobile);

            if (toVal != null) {

                for (NeedyPersonHasGuardian nphg : needyPersonHasGuardians) {
                    ncheck = nphg;
                    temp = nphg.getGuardian();
                    if (temp.getId() == g.getId()) {
                        String ans = request.getParameter("toyear");
                        break;
                    }
                }
            }
            this.needyService.updateGuardian(g, null, np);
        }
        return "guardianprofile.htm?code=" + nid + "&gid=" + gid + "&gval=" + String.valueOf(ncheck.getId());
    }

    @RequestMapping(value = "/updateguardian", method = RequestMethod.POST)
    public String updateNeedyGuardian(HttpServletRequest request) {
        String code = request.getParameter("gncode");
        String rel = request.getParameter("gtype");
        String from = request.getParameter("gfrom");
        String to = request.getParameter("gto");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String gender = request.getParameter("ggender");
        String nic = request.getParameter("gnic");
        String addressLine1 = request.getParameter("gaddr1");
        String addressLine2 = request.getParameter("gaddr2");
        String city = request.getParameter("gcity");
        String postalcode = request.getParameter("gpostalcode");
        String email = request.getParameter("gemail");
        String mobile = request.getParameter("gmobile");

        boolean boo = (fname.length() == 0 || lname.length() == 0 || nic.length() == 0 || addressLine1.length() == 0 || city.length() == 0 || postalcode.length() == 0);

        if (boo == false) {
            System.out.println("@@@##");
            NeedyPerson np = this.needyService.receiveCode(code);
            Guardian g = new Guardian();
            g.setRelationship(rel);
            g.setFirstName(fname);
            g.setLastName(lname);
            g.setGender(gender);
            g.setNic(nic);
            g.setAddressLine1(addressLine1);
            g.setAddressLine2(addressLine2);
            g.setCity(city);
            g.setPostalCode(postalcode);
            g.setEmail(email);
            g.setMobile(mobile);

            Set<NeedyPersonHasGuardian> set = new HashSet<>();
            NeedyPersonHasGuardian nphg = new NeedyPersonHasGuardian();
            nphg.setNeedyPerson(np);
            nphg.setGuardian(g);
            nphg.setStartingYear(Integer.parseInt(from));
            nphg.setEndingYear(Integer.parseInt(to));
            set.add(nphg);
            np.setNeedyPersonHasGuardians(set);

            this.needyService.updateGuardian(g, set, np);

        }
        return "redirect:needyprofile.htm?code=" + code;
    }

    @RequestMapping(value = "/updateneedycontact", method = RequestMethod.POST)
    public String updateNeedyContact(HttpServletRequest request) {
        String code = request.getParameter("ncode");
        String ad1 = request.getParameter("address1");
        String ad2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String postal = request.getParameter("postal");
        String mob = request.getParameter("mobile");
        //String em = request.getParameter("email");
        NeedyPerson needyPerson = this.needyService.receiveCode(code);

        needyPerson.setAddressLine1(ad1);
        needyPerson.setAddressLine2(ad2);
        needyPerson.setCity(city);
        needyPerson.setPostalCode(postal);
        needyPerson.setMobile(mob);

        this.needyService.updateNeedyContact(needyPerson);
        return "redirect:needyprofile.htm?code=" + code;
    }

    @RequestMapping(value = "/updateneedyprofile", method = RequestMethod.POST)
    public String updateNeedyBasicProfile(HttpServletRequest request, @RequestParam(value = "martiallevel", required = false) String mval,
            @RequestParam(value = "edulevel", required = false) String eval,
            @RequestParam(value = "booleandeath", required = false) String deathval
    ) {

        String code = request.getParameter("ncode");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String flname = request.getParameter("fullname");
        String[] cat = request.getParameterValues("cat");
        String[] subcat = request.getParameterValues("subcat");
        String[] from = request.getParameterValues("from");
        String[] to = request.getParameterValues("to");

        String martial = null;
        String edu = null;

        Set<DeathDetail> dds = new HashSet<>();

        NeedyPerson needyPerson = this.needyService.receiveCode(code);

        if (fname.length() != 0 && lname.length() != 0 && flname.length() != 0) {
            needyPerson.setFirstName(fname);
            needyPerson.setLastName(lname);
            needyPerson.setFullName(flname);
        }

        if (mval != null) {
            martial = checkMartialStatus(request.getParameter("martialans"));
            needyPerson.setMartialStatus(martial);
        }
        if (eval != null) {
            edu = checkEducationalLevel(request.getParameter("eduans"));
            needyPerson.setEducationalLevel(edu);
        }
        ////
        String val, subval;
        PrivateRecord pr;

        PrivateRecordHasNeedyPerson prhnp;

        Set<PrivateRecordHasNeedyPerson> privateRecordHasNeedyPersons = new HashSet<>();
        if (cat != null) {
            for (int i = 0; i < cat.length; i++) {
                val = cat[i];
                subval = subcat[i];

                //receive the object vlaue of pvt record
                pr = needyService.serachDisability(val, subval);

                prhnp = new PrivateRecordHasNeedyPerson();

                // prhnp.setId((int) needyService.searchNeedyhasPvtRecord());
                prhnp.setNeedyPerson(needyPerson);
                prhnp.setPrivateRecord(pr);
                prhnp.setStartingYear(Integer.valueOf(from[i]));
                prhnp.setEndingYear(Integer.valueOf(to[i]));
                prhnp.setStatus("A");

                privateRecordHasNeedyPersons.add(prhnp);

            }
        }

        needyPerson.setPrivateRecordHasNeedyPersons(privateRecordHasNeedyPersons);

        ////////
        String deathdate = null;
        String reason = null;
        String location = null;
        String comment = null;

        if (deathval != null) {

            Set<DeathDetail> set = needyPerson.getDeathDetails();
            String[] split2 = null;
            deathdate = request.getParameter("deathday");
            reason = request.getParameter("reason");
            location = request.getParameter("location");
            comment = request.getParameter("comment");
            String deathday = null;;
            if (deathdate != null && set.isEmpty()) {
                try {

                    split2 = deathdate.split("/");

                    deathday = split2[2] + "-" + split2[1] + "-" + split2[0];
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    Date death = df.parse(deathday);

                    DeathDetail deathDetail = new DeathDetail();
                    DeathDetailId ddi = new DeathDetailId();
                    ddi.setId((int) this.needyService.searchDeathRecords());
                    ddi.setNeedyPersonId(needyPerson.getId());
                    deathDetail.setId(ddi);
                    deathDetail.setComment(comment);
                    deathDetail.setDeathDate(death);
                    deathDetail.setLocation(location);
                    deathDetail.setReason(reason);
                    deathDetail.setNeedyPerson(needyPerson);
                    dds.add(deathDetail);
                    needyPerson.setDeathDetails(dds);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
            }

        }

        this.needyService.updateNeedyPersonRecords(needyPerson, privateRecordHasNeedyPersons, dds);
        return "redirect:needyprofile.htm?code=" + code;

    }

    @RequestMapping(value = "/advancedsearchneedy", method = RequestMethod.GET)
    public String searchNeedyAdvanced(
            HttpSession httpSession,
            @RequestParam Map<String, String> reqPar,
            @RequestParam(value = "gender", required = false) String genderVal,
            @RequestParam(value = "bloodgroup", required = false) String bloodGroupVal,
            @RequestParam(value = "ds", required = false) String dsVal,
            @RequestParam(value = "province", required = false) String proVal,
            @RequestParam(value = "district", required = false) String discVal,
            @RequestParam(value = "age", required = false) String ageVal,
            @RequestParam(value = "disability", required = false) String disbVal,
            HttpServletRequest request,
            ModelMap map) throws ParseException {
        String key = reqPar.get("keyword");
        String cat = reqPar.get("category");

        String gender = null;
        String province = null;
        String district = null;
        String bloodgroup = null;
        String ds = null;
        String disb = null;
        String subdisb = null;
        int age1 = 0;
        int age2 = 0;

        if (ageVal != null) {
            String a1 = request.getParameter("age1");
            String a2 = request.getParameter("age2");
            if (Integer.valueOf(a2) >= Integer.valueOf(a1)) {
                age1 = Integer.valueOf(a1);
                age2 = Integer.valueOf(a2);
            }
        }

        if (genderVal != null) {
            String genderAns = request.getParameter("genderans");
            gender = checkGender(genderAns);
        }
        if (bloodGroupVal != null) {
            String bloodAns = request.getParameter("bloodgroupans");
            bloodgroup = checkBloodGroup(bloodAns);
        }
        if (dsVal != null) {
            String ans = request.getParameter("dsans");
            ds = ans;
        }
        if (proVal != null) {
            String ans = request.getParameter("provinceans");
            province = ans;
        }
        if (discVal != null) {
            String ans = request.getParameter("districtans");
            district = ans;
        }
        if (disbVal != null) {
            disb = request.getParameter("disbans");
            subdisb = request.getParameter("subdisbans");

        }
        //if
        User u = (User) request.getSession().getAttribute("LOGGEDIN_USER");

        List<NeedyPerson> searchNeedyPerson = this.needyService.searchAdvancedNeedyPerson(key, cat,
                gender, bloodgroup, ds, province, district, age1, age2, disb, subdisb, u);
        map.addAttribute("needyList", searchNeedyPerson);
        //ModelAndView mav=new ModelAndVie
        //mav.addObject(searchNeedyPerson);
        return "view_needy";
    }

    @RequestMapping(value = "/needyprofile", method = RequestMethod.GET)
    public ModelAndView displayNeedyProfile(@RequestParam("code") String code) {
        ModelAndView mav = new ModelAndView("needy_profile");
        mav.addObject("code", code);
        NeedyPerson searchNeedyPerson = this.needyService.receiveCode(code);
        mav.addObject("needyperson", searchNeedyPerson);
        return mav;
    }

//    @ExceptionHandler(value = Exception.class)
//    public ModelAndView handleNullPointerException(Exception e) {
//        //model.addAttribute("errormsg","Incorrect Login Details!!");
//
//        ModelAndView modelAndView = new ModelAndView("redirect:newneedy1.htm");
//        modelAndView.addObject("errormsg", "Please fill the required fields");
//        Session session=Connection.Controller.getSessionFactory().openSession();
//        NeedyDAOImp ndaoi=new NeedyDAOImp();
//        String receiveCode = ndaoi.receiveCode(session);
//        modelAndView.addObject("needycode", receiveCode);
//        session.close();
//      
//        //modelAndView.addObject("needycode",dupval);
//        return modelAndView;
//    }
}
