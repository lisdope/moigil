package com.springbook.biz.file;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FilesController {
	
	@Autowired
	FilesService filesService;

	@RequestMapping("mung/insert")
	public String Insert() {
		
		return "mung/insert";
	}
	
	@RequestMapping("mung/fileinsert")
	public String fileinsert(MultipartHttpServletRequest request, @RequestPart MultipartFile files) throws Exception{
		Files file = new Files();
		
		String sourceFileName = files.getOriginalFilename(); 
        		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
        		File destinationFile; 
        		String destinationFileName;
        		String fileUrl = "C:\\moigilsub\\MoigilGallery\\src\\main\\resources\\static\\images\\";
		

        		do { 
            			destinationFileName = RandomStringUtils.randomAlphanumeric(20) + "." + sourceFileNameExtension; 
            			destinationFile = new File(fileUrl + destinationFileName); 
        		} while (destinationFile.exists()); 
        
        		destinationFile.getParentFile().mkdirs(); 
        		files.transferTo(destinationFile);
        
        		file.setFilename(destinationFileName);
        		file.setFileOriName(sourceFileName);
        		file.setFileurl(fileUrl);
        		filesService.save(file);
			return "redirect:/mung/insert";
	}	
	
    @PostMapping("imageUpload.do")
	public String uploadMulti(@RequestParam("files") List<MultipartFile> files) throws Exception {
//	    String rootPath = FileSystemView.getFileSystemView().getHomeDirectory().toString(); // 실제 값 = C:\Users\inseo\Desktop\
	    String basePath = "\\static\\images\\multi" ;
	    // 파일 업로드(여러개) 처리 부분
	    for(MultipartFile file : files) {
//	        String originalName = file.getOriginalFilename();
	        String destinationFileName = RandomStringUtils.randomAlphanumeric(20) + ".jpg";
	        String filePath = basePath + "/" + destinationFileName;
	        File dest = new File(filePath);
	        file.transferTo(dest);
	    }
	    return "uploaded.jsp";
	}
}
