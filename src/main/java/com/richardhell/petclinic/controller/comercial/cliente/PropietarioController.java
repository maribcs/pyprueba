package com.richardhell.petclinic.controller.comercial.cliente;

import com.richardhell.petclinic.dao.PersonaDAO;
import com.richardhell.petclinic.dao.PropietarioDAO;
import com.richardhell.petclinic.model.Persona;
import com.richardhell.petclinic.model.Propietario;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@Transactional
@SessionAttributes("propietario")
@RequestMapping("com/propietario")
public class PropietarioController {
    
    @Autowired
    PersonaDAO personaDAO;
    
    @Autowired
    PropietarioDAO propietarioDAO;
    

    
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model){
        
        model.addAttribute("propietarios", propietarioDAO.all());
        return "comercial/cliente/propietario";
    }

    @RequestMapping("new")
    public String create(Model model) {

        model.addAttribute("propietario", new Propietario());
        model.addAttribute("persona", new Persona());
        return "comercial/cliente/propietarioForm";
    }
    
    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        Propietario pro = propietarioDAO.find(new Propietario(id));
        model.addAttribute("propietario", pro);
        model.addAttribute("persona", pro.getPersona());
        return "comercial/cliente/propietarioForm";
    }
    
    @RequestMapping("save")
    public String save(Propietario pro) {

        if (pro.getId() == null) {
            Persona persona = pro.getPersona();
            personaDAO.saveDAO(persona);

            pro.setFechaRegistro(new Date());
            propietarioDAO.saveDAO(pro);
        } else {
            
            Persona persona = pro.getPersona();
            personaDAO.updateDAO(persona);

        }
        return "redirect:/com/propietario";
    }
    
    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        propietarioDAO.deleteDAO(new Propietario(id));
        return "redirect:/com/propietario";
    }
}

