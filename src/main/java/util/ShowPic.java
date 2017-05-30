package util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * 
 * <p>className:ShowPic</p>
 * <p>Description:用户展示上传的文件</p>
 * <p>author:舒莉</p>
 * <p>date 2017年2月6日下午12:17:09</p>
 *
 */
@WebServlet(name="ShowPic",urlPatterns="/ShowPic.action")
public class ShowPic extends HttpServlet{
 
	private static final long serialVersionUID = -398877118676285650L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		 this.doPost(req, resp);
		 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		String imageURL= req.getParameter("imageURL");
		File f1 = new File(imageURL);
		if (!f1.exists()) {
			String message = "服务器上不存在文件";
		}
		response.setContentType(getServletContext().getMimeType(imageURL));
		response.setHeader("Content-Disposition", "inline;filename="+imageURL);
		
		InputStream is = new FileInputStream(f1);
		OutputStream os = response.getOutputStream();
		
		int i = 0;
		byte[] b = new byte[1024];
		while ((i = is.read(b)) != -1) {
			os.write(b, 0, i);
		}
		os.close();
		is.close();
	}
	

}
