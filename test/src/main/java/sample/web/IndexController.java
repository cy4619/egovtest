package sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index.do")
	public String index(ModelMap model) {
		return "sample/index.sample-layout";
	}
}
