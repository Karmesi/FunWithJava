/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.User;
import Services.SingleService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @Autowired
    public SingleService serv;
    private String localUser;

    @RequestMapping(value = "index.htm")
    public String home() {
        return "index";
    }

    @RequestMapping(value = "register.htm")
    public String registerUsers() {
        return "register";
    }

    @RequestMapping(value = "main", method = RequestMethod.POST)
    public ModelAndView loginUser(
            @RequestParam("username") String username,
            @RequestParam("password") String password
    ) {
        List list = serv.userLogin(username, password);
        if (list.size() > 0) {
            this.localUser = password;
            ModelAndView view = new ModelAndView("main");
            List history = serv.userHistory(username);
            view.addObject("user_data", list);
            view.addObject("user_history", history);
            return view;
        } else {
            ModelAndView view = new ModelAndView("index");
            view.addObject("mjs", "<div style='color: red;'>Username o Password incorrectos.</div>");
            return view;
        }
    }
    
    /* La fórmula del IMC es
     * el peso en kilógramos
     * dividido por el cuadrado de la altura en metros
     * (kg/m2)
     */
    @RequestMapping(value = "imc", method = RequestMethod.POST)
    public ModelAndView imcUser(
            @RequestParam("height") Float height,
            @RequestParam("weight") Float weight,
            @RequestParam("age") Integer age,
            @RequestParam("username") String username
    ) {
        if (height >= 1.0 && height <= 2.5 && weight >= 40.0) {
            float imc = height * height;
            imc = weight / imc;
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
            Date dateNow = new Date(System.currentTimeMillis());

            serv.bmiRegister(username, formatter.format(dateNow).toString(), imc, height, weight, age);
        }

        ModelAndView view = new ModelAndView("main");
        
        List list = serv.userLogin(username, this.localUser);
        List history = serv.userHistory(username);
        view.addObject("user_data", list);
        view.addObject("user_test", this.localUser);
        view.addObject("user_history", history);

        return view;
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ModelAndView registerUserNew(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("firstName") String firstName,
            @RequestParam("middleName") String middleName,
            @RequestParam("lastName") String lastName,
            @RequestParam("gender") String gender,
            @RequestParam("height") Float height,
            @RequestParam("weight") Float weight,
            @RequestParam("age") Integer age
    ) {
        List list = serv.userLogin(username, password);
        ModelAndView view = new ModelAndView("register");
        String msg;
        if (list.size() > 0) {
            msg = "<div style='color: red;'>ERROR, usuario ya existe.</div>";
        } else { 
            serv.userRegister(username, password, firstName, middleName, lastName, gender, height, weight, age);
            msg = "<div style='color: blue;'>GOOD, Usuario registrado</div>";
        }
        view.addObject("mjs", msg);
        return view;
    }
}
