package kr.co.nftf.photo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PhotoMapper {
	public int count (Photo photo) throws Exception;
	
	public void insert (Photo photo) throws Exception;
	
	public Photo select (Photo photo) throws Exception;
	
	public List<Photo> list (Photo photo) throws Exception;
	
	public void update (Photo photo) throws Exception;
	
	public void delete (Photo photo) throws Exception;
}