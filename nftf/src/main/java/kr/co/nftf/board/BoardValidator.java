package kr.co.nftf.board;


import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class BoardValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return Board.class.isAssignableFrom(clazz);
    }
 
    @Override
    public void validate(Object target, Errors errors) {
    	Board board = (Board) target;
        
        if(board.getTitle() == null || board.getTitle().trim().isEmpty()) {
            errors.rejectValue("title", "required", "제목은 필수 정보입니다.");
        }
        
        if(board.getDivision() == 0) {
        	errors.rejectValue("division", "required","거래 구분은 필수 정보입니다.");
        }
        
        if(board.getTradeWay() == 0) {
        	errors.rejectValue("tradeWay", "required","거래 방식은 필수 정보입니다.");
        }
        
        if(board.getPrice() == null || board.getTitle().trim().isEmpty()) {
        	errors.rejectValue("price", "required","가격은 필수 정보입니다.");
        } else {
        	if (isStringDouble(board.getPrice()) != true) {
        		errors.rejectValue("price", "required", "가격은 숫자만 입력이 가능합니다.");
        	}
        }
        
        if(board.getContent() == null || board.getContent().trim().isEmpty()) {
        	errors.rejectValue("content", "required","내용은 필수 정보입니다.");
        }
    }

    public boolean isStringDouble(String value) {
		try {
			Double.parseDouble(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
    }
}

