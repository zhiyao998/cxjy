package lcsw.util.upload;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import lcsw.util.random.IDUtils;

public class FileUpload {
	
	
	public static String uploadFile(MultipartFile file,HttpServletRequest request){
		DateFormat df = new SimpleDateFormat("/yyyy/MM/dd");
		String filePath = "";
        // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {  
            	String imagePath = df.format(new Date());
            	String imageName = IDUtils.genImageName();
    			//得到文件的后缀名称
    			String lastfix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
    			//构建出一个新的文件名
    			imageName = imageName + lastfix;
                // 文件保存路径  
                filePath += request.getSession().getServletContext().getRealPath("/") + "temp" + imagePath + ("/")
                        + imageName;
                // 转存文件 
                File f = new File(filePath);
                if(!f.getParentFile().exists()){
                	f.getParentFile().mkdirs();
                	f.createNewFile();
                    file.transferTo(f); 
                } 
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }
        return filePath;
	}
}
