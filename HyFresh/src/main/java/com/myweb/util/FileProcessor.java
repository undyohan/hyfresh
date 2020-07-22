package com.myweb.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myweb.domain.CategoryVO;

@Component
public class FileProcessor {
	private static Logger log = LoggerFactory.getLogger(FileProcessor.class);
	private static final String filePath = "C:/_web/_spring/icon/";

	public CategoryVO fileSave(MultipartHttpServletRequest multiReq) {
		String catename = multiReq.getParameter("catename");
		int catecode = Integer.parseInt(multiReq.getParameter("catecode"));
		MultipartFile iconObj = multiReq.getFile("iconfile");
		String iconName = "";
		if(iconObj.getSize()!=0) {
			String orgFileName = iconObj.getOriginalFilename();
			String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
			File fileObj = new File(filePath + saveFileName);
			try {
				iconObj.transferTo(fileObj);
				iconName = saveFileName;
			} catch (IllegalStateException | IOException e) {
				log.info(">>>>>> File Save Fail");
				e.printStackTrace();
			}
		}
		CategoryVO catevo = new CategoryVO(catename, catecode, iconName);
		return catevo;
	}

	public CategoryVO fileModify(MultipartHttpServletRequest multiReq) {
		int modSign = Integer.parseInt(multiReq.getParameter("delImg"));
		int cateno = Integer.parseInt(multiReq.getParameter("cateno"));
		String catename = multiReq.getParameter("catename");
		int catecode = Integer.parseInt(multiReq.getParameter("catecode"));
		String old_imgfileName = multiReq.getParameter("old_imgfile");
		String iconfileName = "";
		if(modSign == 0) {
			iconfileName = old_imgfileName;
		} else if(modSign==1) {
			removeFile(old_imgfileName);
			iconfileName = "";
		} else if(modSign==2) {
			MultipartFile iconObj = multiReq.getFile("iconfile");
			String orgFileName = iconObj.getOriginalFilename();
			String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
			File fileObj = new File(filePath + saveFileName);
			try {
				iconObj.transferTo(fileObj);
				iconfileName = saveFileName;
				if(!old_imgfileName.equals("")) {
					new File(filePath + old_imgfileName).delete();
				}
			} catch (IllegalStateException | IOException e) {
				log.info(">>>>>> File Save Fail");
				e.printStackTrace();
			}
		}
		CategoryVO catevo = new CategoryVO(cateno, catename, catecode, iconfileName);
		return catevo;
	}
	
	public int removeFile(String imgfile) {
		boolean isRm = new File(filePath + imgfile).delete();
		return isRm == true ? 1 : 0;
	}
}
