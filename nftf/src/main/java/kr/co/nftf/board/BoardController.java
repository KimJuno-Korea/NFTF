package kr.co.nftf.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
import kr.co.nftf.photo.PhotoMapper;
import kr.co.nftf.photo.PhotoService;
import kr.co.nftf.photo.PhotoUtil;

@RestController
public class BoardController {
	@Autowired
	private BoardService boardServiceImpl;
	
	@Autowired
	private PhotoService photoServiceImpl;
	
	@Value("${photo.path}")
	private String uploadPath;
	
	@GetMapping("/board")
	public ModelAndView getBoardList() {
		ModelAndView modelAndView = new ModelAndView("/board/list");
		List<Board> listBoard = new ArrayList<>();
		try {
			listBoard = boardServiceImpl.boardList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("board");
		modelAndView.addObject(listBoard);

		return modelAndView;
	}

	@GetMapping("/board/{no}")
	public ModelAndView getBoard(@PathVariable String no) {
		ModelAndView modelAndView = new ModelAndView("/board/detail");
		Board board = new Board();
		List<Photo> photoList = new ArrayList<>();
		Photo photo = new Photo();
		
		board.setNo(Integer.valueOf(no));
		photo.setBoardNo(board.getNo());
		
		try {
			board = boardServiceImpl.boardSelect(board);
			photoList = photoServiceImpl.photoList(photo);
			for(int i = 0; i < photoList.size(); i ++) {
				System.out.println(photoList.get(i).getBoardNo());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		modelAndView.addObject("board", board);
		modelAndView.addObject("photoList", photoList);

		return modelAndView;
	}

	@PostMapping(value = "/boardsearch", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public List<Board> searchBoard(String keyword) {
		List<Board> listBoard = new ArrayList<>();
		
		try {
			listBoard = boardServiceImpl.boardSearch(keyword);
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
		
		try {
			board = boardServiceImpl.boardSelect(board);
		} catch(Exception e) {
			e.printStackTrace();
		}

		modelAndView.addObject("board", board);

		return modelAndView;
	}

	@PutMapping("/board/{no}")
	public ModelAndView editBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board");
		try {
			boardServiceImpl.boardEdit(board);
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

	@PostMapping("/board")
	public ModelAndView registBoard(Board board, @RequestParam("file") MultipartFile[] file) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board"); //게시글 목록으로
		PhotoUtil photoUtil = new PhotoUtil();
		
		try {
			boardServiceImpl.boardRegist(board);
			board = boardServiceImpl.boardSelect(board);
			Photo photo = new Photo();
			
			for (int i = 0; i < file.length; i ++) {
				String fileName = null;

				if(!file[i].getOriginalFilename().equals("") && !file[i].getOriginalFilename().equals(null)) {
					fileName =  photoUtil.fileUpload(uploadPath, file[i].getOriginalFilename(), file[i].getBytes()); 
					
					photo.setBoardNo(board.getNo());
					photo.setPath(uploadPath + File.separator);
					photo.setLogicalName(file[i].getOriginalFilename());
					photo.setPhysicalName(fileName);

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

	@DeleteMapping("/board/{no}")
	public ModelAndView deleteBoard(Board board) {
		ModelAndView modelAndView = new ModelAndView("redirect:/board");
		Photo photo = new Photo();
		List<Photo> photoList = new ArrayList<>();
		
		PhotoUtil photoUtil = new PhotoUtil();
		photo.setBoardNo(board.getNo());
		try {
			photoList = photoServiceImpl.photoList(photo);
			for (int i = 0; i < photoList.size(); i ++) {
				photoUtil.deleteFile(photoList.get(i));				
			}
			
			photoServiceImpl.photoDelete(photo);
			boardServiceImpl.boardDelete(board);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return modelAndView;
	}
}
