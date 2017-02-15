package dao;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import bean.Barcode1DLog;

public class Barcode1DLogDao {
	public static void saveLog(ArrayList<Barcode1DLog> list) {
		//创建excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		//创建工作表
		HSSFSheet sheet = wb.createSheet("sheet1");
		//创建第一行
		HSSFRow row = sheet.createRow(0);
		//设置表格的格式
		HSSFCellStyle style = wb.createCellStyle();
		//单元格居中对齐
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		//设置字体
		HSSFFont font = wb.createFont();
		font.setFontName("幼圆");
		font.setFontHeightInPoints((short)15);
		//把字体应用到当前的样式
		style.setFont(font);
		
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("S/N");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("status");
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue("result");
		cell.setCellStyle(style);

		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 1);
			Barcode1DLog b1d1 = list.get(i);
			cell = row.createCell(0);
			cell.setCellValue(b1d1.getSnnumber());
			cell.setCellStyle(style);

			cell = row.createCell(1);
			cell.setCellValue(b1d1.getStatus());
			cell.setCellStyle(style);

			cell = row.createCell(2);
			cell.setCellValue(b1d1.getBarcodeID());
			cell.setCellStyle(style);
		}

		sheet.autoSizeColumn((short) 0); // 调整第一列宽度
		sheet.autoSizeColumn((short) 1); // 调整第二列宽度
		sheet.autoSizeColumn((short) 2); // 调整第三列宽度
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		String datestr = sdf.format(date);
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("H:\\Barcode1DLog\\" + datestr
					+ " Log.xls");
			wb.write(fos);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
