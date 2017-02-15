package dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import bean.Barcode1DLog;

public class CallPython {
	public static void fileIoFile() throws IOException {
		File file1 = new File(
				"C:\\Users\\Administrator\\Workspaces\\MyEclipse 9\\TomcatSystem\\WebRoot");
		File file2 = new File("H:\\tomcat\\webapps\\TestSystem");
		copyFile(file1, file2);
	}

	public static void copyFile(File file1, File file2) throws IOException {
		File[] filelist = file1.listFiles();
		for (File file : filelist) {
			System.out.println(file.getAbsolutePath());
			File newfile = new File(file2, file.getName());
			if (file.isDirectory()) {
				newfile.mkdirs();
				copyFile(file, newfile);
			} else {
				BufferedInputStream bis = new BufferedInputStream(
						new FileInputStream(file));
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(newfile));
				//file和newfile千万别写反了，否则将0Kb的文件复制到又信息的文件
				
				byte[] bys = new byte[1024];
				int len = 0;
				while ((len = bis.read(bys)) != -1) {
					bos.write(bys, 0, len);
					bos.flush();
				}
				bos.close();
				bis.close();
			}
		}
	}

	public static String callPython(String command) throws IOException {
		Process pr = Runtime.getRuntime().exec(command);
		BufferedReader br = new BufferedReader(new InputStreamReader(
				pr.getInputStream()));
		StringBuilder text = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			text.append(line).append("<br>");
		}
		br.close();
		return new String(text);
	}

	public static String callBarcode1D(String command) throws IOException {
		Process pr = Runtime.getRuntime().exec(command);
		BufferedReader br = new BufferedReader(new InputStreamReader(
				pr.getInputStream()));
		StringBuilder text = new StringBuilder();

		String snnumber = null;
		String status = null;
		String result = null;
		ArrayList<Barcode1DLog> list = new ArrayList<Barcode1DLog>();
		String line = null;
		while ((line = br.readLine()) != null) {
			text.append(line).append("<br>");

			if (line.startsWith("the status"))
				status = line.split(":")[1];
			if (line.startsWith("the result"))
				if (line.split(":").length <= 1)// 如果：后面为空，则数组越界
					result = " ";
				else
					result = line.split(":")[1];
			if (line.startsWith("snnumber"))
				snnumber = line.split(":")[1];
			if (status != null && result != null && snnumber != null) {
				Barcode1DLog b1dl = new Barcode1DLog(snnumber, status, result);
				list.add(b1dl);
				snnumber = status = result = null;
			}
		}
		br.close();
		Barcode1DLogDao.saveLog(list);
		return new String(text);

	}
}
