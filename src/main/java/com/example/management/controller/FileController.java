package com.example.management.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.management.common.MessageConstant;
import com.example.management.common.Result;
import com.example.management.common.StatusCode;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * @Auth: yz
 * @Desc: upload file controller
 */
@RestController
@RequestMapping("/apartment")
public class FileController {
	/**
	 * description: upload file
	 * @param file	file
	 * @param request	request target
	 * @param response 	response target
	 * @return : com.example.management.common.Result
	 */
	@RequestMapping(value="/fileupload")
	public Result uploads(@RequestParam("file")MultipartFile file, HttpServletRequest request,HttpServletResponse response) throws IOException {
		//get the absolute path
		String absolutePath = System.getProperty("user.dir");
		//save path
		String savePath = absolutePath+"/src/main/resources/static/fileupload/";
		//path in database
		String saveUrl = "/fileupload/";
		// file type
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");

		// Max size
		long maxSize = 10000000; //10M
		response.setContentType("text/html; charset=UTF-8");
		if (!ServletFileUpload.isMultipartContent(request)) {
			return new Result(false, StatusCode.ERROR,MessageConstant.NO_FILE_SELECTED);
		}

		File uploadDir = new File(savePath);
		// if the folder does not exit, create one
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// check permission
		if (!uploadDir.canWrite()) {
			return new Result(false, StatusCode.ERROR,MessageConstant.NO_WRITE_PERMISSION);
		}

		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "image";
		}
		if (!extMap.containsKey(dirName)) {
			return new Result(false, StatusCode.ERROR,MessageConstant.INCORRECT_DIRECTORY_NAME);
		}

		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		String fileName = null;
		Iterator<Map.Entry<String, MultipartFile>> iter = fileMap.entrySet().iterator();
		for (String s : fileMap.keySet()) {

		}
		for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet().iterator(); it.hasNext();) {
			Map.Entry<String, MultipartFile> entry = it.next();
			MultipartFile mFile = entry.getValue();
			fileName = mFile.getOriginalFilename();
			// check file size
			if (mFile.getSize() > maxSize) {
				return new Result(false, StatusCode.ERROR,MessageConstant.SIZE_EXCEEDS__LIMIT);
			}
			String fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
			if (!Arrays.<String> asList(extMap.get(dirName).split(",")).contains(fileExt)) {
				return new Result(false, StatusCode.ERROR,MessageConstant.FILE_TYPE_ERROR);
			}
			UUID uuid = UUID.randomUUID();
			String path = savePath + uuid.toString() +"."+ fileExt;
			System.out.println("file save to:【"+path+"】");
			saveUrl = saveUrl  + uuid.toString() +"."+ fileExt;

			try {
				BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(path));
				FileCopyUtils.copy(mFile.getInputStream(), outputStream);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return new Result(true,StatusCode.OK, MessageConstant.COMMUNITY_PIC_UPLOAD_SUCCESS,saveUrl);
	}
	/**
	 * delete file
	 * @param fileName	file
	 * @return : com.example.management.common.Result
	 */
	@RequestMapping(value="/delfile")
	public Result fileDel(@RequestParam String fileName){
		String name = fileName.replace("/fileupload/","");
		//get path
		String absolutePath = System.getProperty("user.dir");
		//save path
		String savePath = absolutePath+"/src/main/resources/static/fileupload/";
		File file = new File(savePath+name);
		if (file.exists()){//if the file exists
			file.delete();//delete file
		}
		return new Result(true,StatusCode.OK, MessageConstant.COMMUNITY_PIC_DEL_SUCCESS);
	}
}

