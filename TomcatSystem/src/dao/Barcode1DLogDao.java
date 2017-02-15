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
		//����excel�ļ�
		HSSFWorkbook wb = new HSSFWorkbook();
		//����������
		HSSFSheet sheet = wb.createSheet("sheet1");
		//������һ��
		HSSFRow row = sheet.createRow(0);
		//���ñ��ĸ�ʽ
		HSSFCellStyle style = wb.createCellStyle();
		//��Ԫ����ж���
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		//��������
		HSSFFont font = wb.createFont();
		font.setFontName("��Բ");
		font.setFontHeightInPoints((short)15);
		//������Ӧ�õ���ǰ����ʽ
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

		sheet.autoSizeColumn((short) 0); // ������һ�п��
		sheet.autoSizeColumn((short) 1); // �����ڶ��п��
		sheet.autoSizeColumn((short) 2); // ���������п��
		
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
