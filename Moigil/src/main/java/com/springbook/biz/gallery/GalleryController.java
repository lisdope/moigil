package com.springbook.biz.gallery;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class GalleryController {
	
	@Autowired
	GalleryRepository galleryRepository;
	
	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String uploadMulti(@RequestParam("imageFile") List<MultipartFile> imageFiles, HttpServletRequest request) throws IOException {
		ServletContext rootPath = request.getSession().getServletContext();
		String basePath = rootPath.getRealPath("/galleryImg/");
		// 파일 업로드(여러개) 처리 부분
		for(MultipartFile file : imageFiles) {
//	        String originalName = file.getOriginalFilename();
			String destinationFileName = RandomStringUtils.randomAlphanumeric(20) + ".jpg";
			String filePath = basePath + "/" + destinationFileName;
			File dest = new File(filePath);
			file.transferTo(dest);
			return destinationFileName;
		}
		return "";
	}
	
//	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST) 
//	@ResponseBody
//	public String saveFile(HttpServletRequest request) throws IOException {
//		String imgFolder ="\\galleryImg\\"; //저장할 경로
//		String realFolder = request.getRealPath("/") + imgFolder; //web-inf바로전 까지 저장할 경로
//		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;
//		MultipartFile file = multipartRequest.getFile("imageFile"); //단일 파일 업로드
//		String filename = file.getOriginalFilename();
//
//		File ufile = new File(realFolder + file.getOriginalFilename());
//		file.transferTo((ufile));
//
//		return filename; 
//	}
	
	

//	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String uploadSingle(@RequestParam("Image") MultipartFile file, HttpServletRequest request) throws IOException {
//		ServletContext path = request.getSession().getServletContext();
//	    String filePath = path.getRealPath("/Upload") + "/" + file.getOriginalFilename();
//	    String filename = file.getOriginalFilename();
//	    File dest = new File(filePath);
//	    file.transferTo(dest); // 파일 업로드 작업 수행
//	   return filename;
//	}
	
	
//	@RequestMapping("mung/insert")
//	public String Insert() {
//		
//		return "mung/insert";
//	}
//	
//	@RequestMapping("mung/fileinsert")
//	public String fileinsert(MultipartHttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
//		Files file = new File();
//		
//		String sourceFileName = files.getOriginalFilename(); 
//        		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
//        		File destinationFile; 
//        		String destinationFileName;
//        		String fileUrl = "C:\\moigilsub\\MoigilGallery\\src\\main\\resources\\static\\images\\";
//		
//
//        		do { 
//            			destinationFileName = RandomStringUtils.randomAlphanumeric(20) + "." + sourceFileNameExtension; 
//            			destinationFile = new File(fileUrl + destinationFileName); 
//        		} while (destinationFile.exists()); 
//        
//        		destinationFile.getParentFile().mkdirs(); 
//        		files.transferTo(destinationFile);
//        
//        		file.setFilename(destinationFileName);
//        		file.setFileOriName(sourceFileName);
//        		file.setFileurl(fileUrl);
//        		filesService.save(file);
//			return "redirect:/mung/insert";
//	}	
	
}
