package com.richardhell.petclinic.controller.comercial;

import com.richardhell.petclinic.dao.MascotaDAO;
import com.richardhell.petclinic.dao.VeterinarioDAO;
import com.richardhell.petclinic.dao.VisitaDAO;
import com.richardhell.petclinic.model.Mascota;
import com.richardhell.petclinic.model.Visita;
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
@SessionAttributes("atencion")
@RequestMapping("com/atencion")
public class AtencionController {

    @Autowired
    MascotaDAO mascotaDAO;

    @Autowired
    VeterinarioDAO veterinarioDAO;
    
    @Autowired
    VisitaDAO visitaDAO;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    dateFormat.setLenient(true);
    webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model){
        
        model.addAttribute("visitas", visitaDAO.all());
        return "comercial/atencion/visita";
    }

    @RequestMapping("new")
    public String create(Model model) {

    model.addAttribute("visita", new Visita());
    model.addAttribute("mascotas", mascotaDAO.all());
    model.addAttribute("veterinarios", veterinarioDAO.all());
    return "comercial/atencion/visitaForm";
    }
    
    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        Visita vis = visitaDAO.find(new Visita(id));
        model.addAttribute("visita", vis);
        model.addAttribute("mascotas", mascotaDAO.all());
        model.addAttribute("veterinarios", veterinarioDAO.all());
        return "comercial/atencion/visitaForm";
    }
    
    @RequestMapping("save")
    public String save(Visita vis) {

        if (vis.getId() == null) {
            visitaDAO.saveDAO(vis);
        } else {
            visitaDAO.updateDAO(vis);
        }
        return "redirect:/com/atencion";
    }
    
    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

    visitaDAO.deleteDAO(new Visita(id));
    return "redirect:/com/atencion";
    }    
}
