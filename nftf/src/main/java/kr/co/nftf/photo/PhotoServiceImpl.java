package kr.co.nftf.photo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhotoServiceImpl implements PhotoService {
	@Autowired
	private PhotoMapper photoMapper;
	
	@Override
	public void photoRegist(Photo photo) throws Exception{
		photoMapper.insert(photo);
	}
	
	@Override
	public Photo photoSelect(Photo photo) throws Exception{
		return photoMapper.select(photo);
	}

	@Override
	public List<Photo> photoList(Photo photo) throws Exception{
		return photoMapper.list(photo);
	}

	@Override
	public void photoEdit(Photo photo) throws Exception{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void photoDelete(Photo photo) throws Exception{
		photoMapper.delete(photo);
	}
	
}
