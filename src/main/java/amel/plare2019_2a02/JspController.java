package amel.plare2019_2a02;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {
    
    @RequestMapping(value = "/{v1}/")
    public String getIndexV1(@PathVariable("v1")String v1) {
        return v1+"/index";
    }

    @RequestMapping(value = "/{v1}/{v2}/")
    public String getIndexV2(@PathVariable("v1")String v1, @PathVariable("v2")String v2) {
        return v1+"/"+v2+"/index";
    }

    @RequestMapping(value = "/{v1}/{v2}/{v3}/")
    public String getIndexV3(@PathVariable("v1")String v1, @PathVariable("v2")String v2, @PathVariable("v3")String v3) {
        return v1+"/"+v2+"/"+v3+"/index";
    }
}