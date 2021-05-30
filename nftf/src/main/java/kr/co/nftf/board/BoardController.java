package kr.co.nftf.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nftf.photo.Photo;
import kr.co.nftf.photo.PhotoService;
import kr.co.nftf.photo.PhotoUtil;
import kr.co.nftf.reply.Reply;
import kr.co.nftf.reply.ReplyService;
import kr.co.nftf.reply.ReplyServiceImpl;
import kr.co.nftf.user.User;
import kr.co.nftf.user.UserService;

@RestController
public class BoardController {
	@Autowired
	private BoardService boardServiceImpl;
	
	@Autowired
	private PhotoService photoServiceImpl;
	
	@Autowired
	private UserService userServiceImpl;
	
	@Autowired
	private ReplyService replyServiceImpl;
	
	@Autowired
	private HttpSession session;
	
	@Value("${photo.path}")
	private String uploadPath;
	
	@GetMapping("/board")
	public ModelAndView getBoardList(@RequestParam(value = "num",required = false) String num) {
		ModelAndView modelAndView = new ModelAndView("/board/list");
		List<Board> boardList = new ArrayList<>();
		Paging paging = new Paging();
		int count = 0;

		try {
			count = boardServiceImpl.boardCount();

			paging.setNum(Integer.valueOf(num));
			paging.setCount(boardServiceImpl.boardCount());

			boardList = boardServiceImpl.listPage(paging.getDisplayPost(), paging.getPostNum());

		} catch (Exception e) {
			e.printStackTrace();
		}

		modelAndView.addObject("boardList", boardList);
		modelAndView.addObject("count", count);
		modelAndView.addObject("paging", paging);
		modelAndView.addObject("select", num);
		return modelAndView;
	}
	
	@GetMapping("/board/{no}")
	public ModelAndView getBoard(@PathVariable String no) {
		ModelAndView modelAndView = new ModelAndView("/board/detail");
		List<Photo> photoList = new ArrayList<>();
		Photo photo = new Photo();
		Board board = new Board();
		User user = new User();
		Reply reply = new Reply();
		
		board.setNo(Integer.valueOf(no));
		photo.setBoardNo(board.getNo());
		user.setId(session.getAttribute("id").toString());
		reply.setBoardNo(board.getNo());
		
		try {
			user = userServiceImpl.selectUser(user);
			board = boardServiceImpl.boardSelect(board);
			photoList = photoServiceImpl.photoList(photo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		modelAndView.addObject("board", board);
		modelAndView.addObject("photoList", photoList);
		modelAndView.addObject("pin", user.getPinAccount());

		return modelAndView;
	}
	

	@PostMapping(value = "/boardsearch", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public List<Board> searchBoard(String keyword) {
		List<Board> listBoard = new ArrayList<>();
		
		try {
			listBoard = boardServiceImpl.boardSearch(keyword);
			for (int i = 0; i < listBoard.size(); i ++) {
				System.out.println(listBoard.get(i).getTitle());
			}
			System.out.println("boardsearch");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listBoard;
	}

	@GetMapping("/board/{no}/form")
	public ModelAndView editBoardForm(@PathVariable String no) {
		ModelAndView modelAndView = new ModelAndView("/board/edit");
		Board board = new Board();
		board.setNo(Integer.valueOf(no));
		
		List<Photo> photoList = new ArrayList<>();
		Photo photo = new Photo();
		photo.setBoardNo(board.getNo());
		
		try {
			board = boardServiceImpl.boardSelect(board);
			photoList = photoServiceImpl.photoList(photo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		for (int i = 0; i < photoList.size(); i ++) {
			System.out.println(photoList.get(i).getLogicalName());
		}

		modelAndView.addObject("board", board);
		modelAndView.addObject("photoList", photoList);
		modelAndView.addObject("size", photoList.size());
		
		return modelAndView;
	}
	
	@PostMapping("/board")
	public ModelAndView registBoard(Board board, @RequestParam("file") MultipartFile[] file) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board?num=1"); //게시글 목록으로
		PhotoUtil photoUtil = new PhotoUtil();
		
		try {
			boardServiceImpl.boardRegist(board);
			board = boardServiceImpl.boardSelect(board);
			
			for (int i = 0; i < file.length; i ++) {
				String fileName = null;
				
				if(!file[i].getOriginalFilename().equals("") && !file[i].getOriginalFilename().equals(null)) {
					Photo photo = new Photo();
					fileName =  photoUtil.fileUpload(uploadPath, file[i].getOriginalFilename(), file[i].getBytes());
					photo.setBoardNo(board.getNo());
					photo.setPath(uploadPath + File.separator);
					photo.setLogicalName(file[i].getOriginalFilename());
					photo.setPhysicalName(fileName);
					
					if(i == 0) {
						photo.setThumbnail("s_" + fileName);
					}
					System.out.println("썸네일 : " + photo.getThumbnail());
					photoServiceImpl.photoRegist(photo);
				} else {
					fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}


	@GetMapping("/board/form")
	public ModelAndView registBoardForm() {
		ModelAndView modelAndView = new ModelAndView("/board/form");

		return modelAndView;
	}
	
	@PutMapping("/board/{no}")
	public ModelAndView editBoard(Board board,@RequestParam("file") MultipartFile[] file) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board?num=1");
		Photo photo = new Photo();
		List<Photo> photoList = new ArrayList<>();
		
		PhotoUtil photoUtil = new PhotoUtil();
		photo.setBoardNo(board.getNo());
		try {
			photoList = photoServiceImpl.photoList(photo);
			System.out.println("photoList size : " + photoList.size());
			for (int i = 0; i < photoList.size(); i ++) {
				photoUtil.deleteFile(photoList.get(i));				
			}
			photoServiceImpl.photoDelete(photo);
			
			for (int i = 0; i < file.length; i ++) {
				String fileName = null;
				
				if(!file[i].getOriginalFilename().equals("") && !file[i].getOriginalFilename().equals(null)) {
					photo = new Photo();
					fileName =  photoUtil.fileUpload(uploadPath, file[i].getOriginalFilename(), file[i].getBytes());
					photo.setBoardNo(board.getNo());
					photo.setPath(uploadPath + File.separator);
					photo.setLogicalName(file[i].getOriginalFilename());
					photo.setPhysicalName(fileName);
					
					if(i == 0) {
						photo.setThumbnail("s_" + fileName);
					}
					
					photoServiceImpl.photoRegist(photo);
				} else {
					fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
				}
			}
			boardServiceImpl.boardEdit(board);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}

	@DeleteMapping("/board/{no}")
	public ModelAndView deleteBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board?num=1");
		Photo photo = new Photo();
		Reply reply = new Reply();
		List<Photo> photoList = new ArrayList<>();
		
		PhotoUtil photoUtil = new PhotoUtil();
		photo.setBoardNo(board.getNo());
		reply.setBoardNo(board.getNo());
		try {
			photoList = photoServiceImpl.photoList(photo);
			for (int i = 0; i < photoList.size(); i ++) {
				photoUtil.deleteFile(photoList.get(i));				
			}
			
			replyServiceImpl.replyDelete(reply);
			photoServiceImpl.photoDelete(photo);
			boardServiceImpl.boardDelete(board);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return modelAndView;
	}
}
