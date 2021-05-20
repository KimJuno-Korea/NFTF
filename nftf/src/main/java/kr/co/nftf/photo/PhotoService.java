package kr.co.nftf.photo;

import java.util.List;

public interface PhotoService {
	public void photoRegist (Photo photo) throws Exception;
	
	public List<Photo> photoList (Photo photo) throws Exception;
	
	public Photo photoSelect (Photo photo) throws Exception;
	
	public Photo photoThumbnail (Photo photo) throws Exception;
	
	public void photoEdit (Photo photo) throws Exception;
	
	public void photoDelete (Photo photo) throws Exception;
}
