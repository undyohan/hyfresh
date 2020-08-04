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
import com.myweb.domain.NoticeVO;
import com.myweb.domain.ProductVO;
import com.myweb.domain.QuestionVO;
import com.myweb.domain.ReviewVO;

@Component
public class FileProcessor {
	private static Logger log = LoggerFactory.getLogger(FileProcessor.class);
	private static final String filePath = "C:/_web/_git/upimg/";
	
	/********************************************************************
	1. Title: FileProcessor

	2. Author: 이준우

	3. Revision history
	 2020-07-29 14:26  이준우 최초 정리

	*****************************************************************/
	
	// 제품 등록 시 이미지 저장
	public ProductVO fileSave(MultipartHttpServletRequest multiReq) {
	      String pname = multiReq.getParameter("pname");
	      int price = Integer.parseInt(multiReq.getParameter("price"));
	      int stock = Integer.parseInt(multiReq.getParameter("stock"));
	      int dfee = Integer.parseInt(multiReq.getParameter("dfee"));
	      int discount = Integer.parseInt(multiReq.getParameter("discount"));
	      int cateno = Integer.parseInt(multiReq.getParameter("cateno"));
	      String custom = multiReq.getParameter("custom");
	      String tname = multiReq.getParameter("tname");
	      MultipartFile contentObj = multiReq.getFile("content");
	      MultipartFile imgfileObj = multiReq.getFile("imgfile");
	      String imgfileName = "";
	      String contentfileName= "";
	      
	      if (imgfileObj.getSize() == 0) {
	         imgfileName = "NONE";
	      } else {
	         String orgFileName = imgfileObj.getOriginalFilename();
	         String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
	         File fileObj = new File(filePath + saveFileName);
	         try {
	            imgfileObj.transferTo(fileObj);
	            imgfileName = saveFileName;
	         } catch (IllegalStateException | IOException e) {
	            log.info(">>> File Save Fail");
	            e.printStackTrace();
	         }
	      }
	      if (contentObj.getSize() == 0) {
	    	  contentfileName = "NONE";
	       } else {
	          String orgFileName = contentObj.getOriginalFilename();
	          String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
	          File fileObj = new File(filePath + saveFileName);
	          try {
	        	  contentObj.transferTo(fileObj);
	        	  contentfileName = saveFileName;
	          } catch (IllegalStateException | IOException e) {
	             log.info(">>> Content File Save Fail");
	             e.printStackTrace();
	          }
	       }
	      ProductVO pvo = new ProductVO(cateno, pname, price, "/images/"+contentfileName, "/images/"+imgfileName, stock, dfee, discount, custom, tname);
	      return pvo;
	   }
		//제품 수정시 이미지 등록
		public ProductVO fileModify(MultipartHttpServletRequest multiReq) {
			int modSign = Integer.parseInt(multiReq.getParameter("delImg"));
			int modSign2 = Integer.parseInt(multiReq.getParameter("delImg2"));
			String pname = multiReq.getParameter("pname");
			int price = Integer.parseInt(multiReq.getParameter("price"));
			String content = multiReq.getParameter("content");
			int stock = Integer.parseInt(multiReq.getParameter("stock"));
			int dfee = Integer.parseInt(multiReq.getParameter("dfee"));
			int discount = Integer.parseInt(multiReq.getParameter("discount"));
			int cateno = Integer.parseInt(multiReq.getParameter("cateno"));
			String custom = multiReq.getParameter("custom");
			String tname = multiReq.getParameter("tname");
			String old_imgfileName = multiReq.getParameter("old_imgfile");
			String old_contentfileName = multiReq.getParameter("old_contentfile");
			int pno = Integer.parseInt(multiReq.getParameter("pno"));
			String imgfileName = "";
			String contentfileName = "";
			
			if(modSign == 0) {
				imgfileName = old_imgfileName;
			} else if(modSign == 1) {
				// new File(filePath+old_imgfileName).delete();
				removeFile(old_imgfileName);
				imgfileName = "NONE";         
			} else if(modSign == 2) {
				MultipartFile imgfileObj = multiReq.getFile("imgfile");         
				if (imgfileObj.getSize() == 0) {
					imgfileName = "NONE";
				} else {
					String orgFileName = imgfileObj.getOriginalFilename();
					String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
					File fileObj = new File(filePath + saveFileName);
					try {
						imgfileObj.transferTo(fileObj);
					   
						if (!old_imgfileName.equals("NONE")) { // 기존 이미지 파일 있을경우
							new File(filePath+old_imgfileName).delete();               
						}
						imgfileName = "/images/"+saveFileName;
					} catch (IllegalStateException | IOException e) {
						log.info(">>> File Save Fail");
						e.printStackTrace();
					}
				}         
			}
			  
			if(modSign2 == 0) {
				contentfileName = old_contentfileName;
			} else if(modSign2 == 1) {
				removeFile(old_contentfileName);
				contentfileName = "NONE";         
			} else if(modSign2 == 2) {
				MultipartFile contentfileObj = multiReq.getFile("content");         
				if (contentfileObj.getSize() == 0) {
					contentfileName = "NONE";
				} else {
					String orgFileName = contentfileObj.getOriginalFilename();
					String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
					File fileObj = new File(filePath + saveFileName);
					try {
							contentfileObj.transferTo(fileObj);
						if (!old_contentfileName.equals("NONE")) { // 기존 이미지 파일 있을경우
							new File(filePath+old_contentfileName).delete();               
						}
						contentfileName = "/images/"+saveFileName;
					} catch (IllegalStateException | IOException e) {
						log.info(">>> File Save Fail");
						e.printStackTrace();
					}
				}         
			}
			ProductVO pvo = new ProductVO(pno, cateno, pname, price, contentfileName, imgfileName, stock, dfee, discount, custom, tname);
			return pvo;
		}

		public int removeFile(String imgfile) {
			boolean isRm = new File(filePath+imgfile).delete();
			return isRm == true ? 1 : 0;
	}
	// 리뷰 등록시 이미지 처리
	public ReviewVO reviewSave(MultipartHttpServletRequest multiReq) {
		int pno = Integer.parseInt(multiReq.getParameter("pno"));  
		int rate = Integer.parseInt(multiReq.getParameter("rate"));
		String writer = multiReq.getParameter("writer");
		String title = multiReq.getParameter("title");
		String content = multiReq.getParameter("content");
		MultipartFile imgfileObj = multiReq.getFile("imgfile");
		log.info("img" + imgfileObj);
		String imgfileName = "";
	
	      if (imgfileObj.getSize() == 0) {
	         imgfileName = "NONE";
	      } else {
	         String orgFileName = imgfileObj.getOriginalFilename();
	         String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
	         File fileObj = new File(filePath + saveFileName);
	         try {
	            imgfileObj.transferTo(fileObj);
	            imgfileName = saveFileName;
	         } catch (IllegalStateException | IOException e) {
	            log.info(">>> File Save Fail");
	            e.printStackTrace();
	         }
	      }
	      ReviewVO rvo = new ReviewVO(pno, rate, writer, title, content, "/images/"+imgfileName);
	      return rvo;
   }	
	
	/********************************************************************
	1. Title: 

	2. Author: 

	3. Revision history
	 

	*****************************************************************/

	public CategoryVO CategorySave(MultipartHttpServletRequest multiReq) {
		String catename = multiReq.getParameter("catename");
		int cateno = Integer.parseInt(multiReq.getParameter("cateno"));
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
		CategoryVO catevo = new CategoryVO(cateno, catename, catecode, iconName);
		return catevo;
	}

	public CategoryVO CategoryModify(MultipartHttpServletRequest multiReq) {
		int modSign = Integer.parseInt(multiReq.getParameter("delImg"));
		int cateno = Integer.parseInt(multiReq.getParameter("cateno"));
		int old_cateno = Integer.parseInt(multiReq.getParameter("old_cateno"));
		String catename = multiReq.getParameter("catename");
		int catecode = Integer.parseInt(multiReq.getParameter("catecode"));
		String old_imgfileName = multiReq.getParameter("old_imgfile");
		String iconfileName = "";
		if(modSign == 0) {
			iconfileName = old_imgfileName;
		} else if(modSign==1) {
			CategoryRemove(old_imgfileName);
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
		CategoryVO catevo = new CategoryVO(cateno, catename, catecode, iconfileName, old_cateno);
		return catevo;
	}
	
	public int CategoryRemove(String imgfile) {
		boolean isRm = new File(filePath + imgfile).delete();
		return isRm == true ? 1 : 0;
	}
	
	public NoticeVO NoticeModify(MultipartHttpServletRequest multiReq) {
	      int modSign = Integer.parseInt(multiReq.getParameter("delImg"));
	      String title = multiReq.getParameter("title");
	      String writer = multiReq.getParameter("writer");
	      String content = multiReq.getParameter("content");
	      String old_imgfileName = multiReq.getParameter("old_imgfile");
	      int nno = Integer.parseInt(multiReq.getParameter("nno"));
	      String imgfileName = "";
	      if(modSign == 0) {//새로 첨부된 파일이 없을떄 파일 삭제안했을 때
	         imgfileName = old_imgfileName;
	      }else if(modSign == 1) { //새로 첨부된 파일이 없을떄 파일 삭제
	         new File(filePath+old_imgfileName).delete();
	         imgfileName = "NONE";         
	      }else if(modSign==2) {    
	         MultipartFile imgfileObj = multiReq.getFile("img");         
	            String orgFileName = imgfileObj.getOriginalFilename();
	            String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;
	            File fileObj = new File(filePath + saveFileName);
	            try {
	               imgfileObj.transferTo(fileObj);
	               if (!old_imgfileName.equals("NONE")) { // 기존 이미지 파일 있을경우
	                  new File(filePath+old_imgfileName).delete();               
	               }
	               imgfileName = saveFileName;
	            } catch (IllegalStateException | IOException e) {
	               log.info(">>> File Save Fail");
	               e.printStackTrace();
	            }
	                
	      }      
	      NoticeVO nvo = new NoticeVO(nno, title, writer, content, imgfileName);
	      return nvo;
	   }


	public NoticeVO NoticeSave(MultipartHttpServletRequest multiReq) {
		String title = multiReq.getParameter("title");
		String writer = multiReq.getParameter("writer");
		String content = multiReq.getParameter("content");
		MultipartFile imgfileObj = multiReq.getFile("img");// imgfileObj를 imgfileName으로 넣는 작업해주기
		String imgfileName = "";
		log.info(">>>>>>>>>>떠라떠   "+imgfileObj);
		if (imgfileObj.getSize() == 0) {// null하지말기,null:있는데 아무도 모르는값이라 size없음
			imgfileName = "NONE";
		} else {// 파일이름 꺼내오고 객체저장시켜 줌
			String orgFileName = imgfileObj.getOriginalFilename();// 원래파일 이름, 중복처리해야됨
			String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;// 저장할 saveFileName 이름
			File fileObj = new File(filePath + saveFileName);// 파일객체이름 정해줌
			try {
				imgfileObj.transferTo(fileObj);// transferTo(복사하는 메소드), 받아온 객체를 위의 형식으로 복사
				imgfileName = saveFileName;// 저장된 파일이름으로 바꿔 줌
			} catch (IllegalStateException | IOException e) {
				log.info(">>>File Save Fail");
				e.printStackTrace();
			}
		}
		NoticeVO nvo = new NoticeVO(title, writer, content, imgfileName);
		return nvo;
	}

	public int Noticeremove(String img) {
		boolean isRm=new File(filePath+img).delete();
		return isRm==true?1:0;
	}

	public QuestionVO QuestionSave(MultipartHttpServletRequest multiReq) {
		String title = multiReq.getParameter("title");
		String writer = multiReq.getParameter("writer");
		String content = multiReq.getParameter("content");
		MultipartFile imgfileObj = multiReq.getFile("img");// imgfileObj를 imgfileName으로 넣는 작업해주기
		String imgfileName = "";

		if (imgfileObj.getSize() == 0) {// null하지말기,null:있는데 아무도 모르는값이라 size없음
			imgfileName = "NONE";
		} else {// 파일이름 꺼내오고 객체저장시켜 줌
			String orgFileName = imgfileObj.getOriginalFilename();// 원래파일 이름, 중복처리해야됨
			String saveFileName = UUID.randomUUID().toString() + "_" + orgFileName;// 저장할 saveFileName 이름
			File fileObj = new File(filePath + saveFileName);// 파일객체이름 정해줌
			try {
				imgfileObj.transferTo(fileObj);// transferTo(복사하는 메소드), 받아온 객체를 위의 형식으로 복사
				imgfileName = saveFileName;// 저장된 파일이름으로 바꿔 줌
			} catch (IllegalStateException | IOException e) {
				log.info(">>>File Save Fail");
				e.printStackTrace();
			}
		}
		QuestionVO qvo = new QuestionVO(title, writer, content, imgfileName);
		return qvo;
	}
	
	public int QuestionRemove(String img) {
		boolean isRm=new File(filePath+img).delete();
		return isRm==true?1:0;
	}
}
