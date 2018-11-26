package business;

import java.io.File;
import java.io.IOException;
 
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
 
public class ExcelTools {
	public static Object[][] readexcel(String filename) {
		Object[][] obj=new Object[5][5];
		try {
			File file1=new File(filename);
			Workbook wb=Workbook.getWorkbook(file1);
			Sheet sheet=wb.getSheet(0);
			
			for(int i=0;i<sheet.getRows();i++) {
				for(int j=0;j<sheet.getColumns();j++) {
					Cell cell=sheet.getCell(j,i);
					
					System.out.printf(cell.getContents()+" ");
					obj[i][j]=cell.getContents();
				}
			}
		}catch (BiffException e) {
			e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	        return obj;
	}
}
