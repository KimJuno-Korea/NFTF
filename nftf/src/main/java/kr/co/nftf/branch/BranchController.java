package kr.co.nftf.branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/")
public class BranchController {
	@Autowired
	BranchServiceImpl branchServiceImpl;
	
	@GetMapping("/branch")
	public ModelAndView getBranch () {
		ModelAndView mav;
		
		mav = new ModelAndView("list");
		mav.addObject("branchList", branchServiceImpl.selectBranchList(new Branch()));
		
		return mav;
	}
	
	@GetMapping("/branch/form")
	public ModelAndView createBranchFrom () {
		ModelAndView mav;
		
		mav = new ModelAndView("add");
		
		return mav;	
	}
	
	@PostMapping("/branch")
	public ModelAndView createBranch (Branch branch) {
		ModelAndView mav;
		
		mav = new ModelAndView(new RedirectView("/branch"));
		branchServiceImpl.registBranch(branch);
		
		return mav;	
	}
	
	@GetMapping("/branch/{name}/form")
	public ModelAndView editBranchForm (Branch branch) {
		ModelAndView mav;
		
		mav = new ModelAndView("edit");
		mav.addObject("branch", branchServiceImpl.selectBranch(branch));
		
		return mav;
	}
	
	@PutMapping("/branch/{name}")
	public ModelAndView editBranch (Branch branch) {
		ModelAndView mav;
		
		mav = new ModelAndView(new RedirectView("/branch"));
		branchServiceImpl.editBranch(branch);
		
		return mav;
	}
	
	@DeleteMapping("/branch/{name}")
	public ModelAndView deleteBranch (Branch branch) {
		ModelAndView mav;
		
		mav = new ModelAndView("list");
		branchServiceImpl.deleteBranch(branch);
		
		return mav;
	}
}
