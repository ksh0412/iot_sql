//package project;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.iot.erp.hrm.dto.HumanResourceManagement;
//import com.iot.erp.hrm.service.HrmService;
//
//
//
//@Controller
//public class HrmController {
//
//	@Autowired
//	HrmService hs;
//	
//	@RequestMapping(value="/hrmList/main", method=RequestMethod.POST)
//	public @ResponseBody ModelMap getHumanResourceManagementList(@RequestBody HumanResourceManagement h_resourceManagement, HttpServletRequest request, ModelMap model,
//			HttpSession hss){
//		model.put("humanList", hs.selectHumanResourceManagementList(h_resourceManagement));
//		return model;
//	}
//	
//	@RequestMapping(value="/hrm/list",method=RequestMethod.POST)
//	public @ResponseBody List<HumanResourceManagement> getGoodsInfoList(@RequestBody HumanResourceManagement hrm){
//		return hs.selectHumanResourceManagementList(hrm);
//	}
//	
//	@RequestMapping(value="/hrm/indfoDetail/{humanNum}",method=RequestMethod.GET)
//	public ModelAndView getGoodsInfoList(@PathVariable(value="humanNum")int humanNum, ModelMap map){
//		ModelAndView mav = new ModelAndView("hrm/humanInfoDetail");
//		mav.addObject("test",humanNum);
//		return mav;
//	}	
//}
