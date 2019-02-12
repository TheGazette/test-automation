package cucumber.suite.glue;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.joda.time.DateTime;
import org.apache.poi.ss.usermodel.Cell;

public class Utils {

	public static void prepareXmlUpload(String fileLocation, String replacementText) throws IOException {
		File file = new File(fileLocation);
		String fileContext = FileUtils.readFileToString(file, "UTF-8");
		fileContext = fileContext.replaceAll("_PLACEHOLDER_", replacementText);
		FileUtils.write(file, fileContext, "UTF-8");
	}
	public static void changeDatesInXml(String fileLocation,String dateToBeChanged,String replacementText) throws IOException{
		File file = new File(fileLocation);
		String fileContext = FileUtils.readFileToString(file, "UTF-8");
		fileContext = fileContext.replaceAll(dateToBeChanged+"\">[^<]*(?=<\\/Date>)", replacementText);
		FileUtils.write(file, fileContext, "UTF-8");
	}

	public static void prepareExcelUpload(String fileLocation, String replacementText) {
		File file = new File(fileLocation);
		FileInputStream fis = null;
		FileOutputStream fos = null;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		try {
			Date earliestPubDate = sdf.parse("12/12/2016");
			Date claimExpiryDate = sdf.parse("10/10/2016");
			fis = new FileInputStream(file);
			HSSFWorkbook a = new HSSFWorkbook(fis);
			HSSFSheet my_sheet = a.getSheetAt(1);
			for (Row row : my_sheet) {
				for (Cell cell : row) {
					if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
						if (cell.getDateCellValue().equals(earliestPubDate)) {
							cell.setCellValue(new Date());
						}
					}
					if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
						if (cell.getDateCellValue().equals(claimExpiryDate)) {
							cell.setCellValue(DateUtils.addMonths(new Date(), 3));
						}
					}
				}
			}
			fos = new FileOutputStream(new File(fileLocation));
			a.write(fos);
		} catch (IOException ex) {
			ex.printStackTrace();
		} catch (ParseException ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
				if (fos != null) {
					fos.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

	public static String preparePrintPdfRequest(String fileLocaton, String edition, String isbn, DateTime publicationJodaDateTime,
			DateTime startJodaDateTime, DateTime endJodaDateTime, String pageNumber, String issueNumber) {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

		String editionLowerCase = edition.toLowerCase();
		String editionTitleCase = StringUtils.capitalize(edition);
		
		Calendar publicationDateCal = Calendar.getInstance();
		publicationDateCal.setTime(publicationJodaDateTime.toDate());
		publicationDateCal.set(Calendar.HOUR_OF_DAY, 0);
		publicationDateCal.set(Calendar.MINUTE, 0);
		publicationDateCal.set(Calendar.SECOND, 0);
		publicationDateCal.set(Calendar.MILLISECOND, 0);

		Date publicationDate = publicationDateCal.getTime();

		Calendar startDateTimeCal = Calendar.getInstance();
		startDateTimeCal.setTime(startJodaDateTime.toDate());
		startDateTimeCal.set(Calendar.HOUR_OF_DAY, 0);
		startDateTimeCal.set(Calendar.MINUTE, 0);
		startDateTimeCal.set(Calendar.SECOND, 0);
		startDateTimeCal.set(Calendar.MILLISECOND, 0);

		Date startDateTime = startDateTimeCal.getTime();

		Calendar endDateTimeCal = Calendar.getInstance();
		endDateTimeCal.setTime(endJodaDateTime.toDate());
		endDateTimeCal.set(Calendar.HOUR_OF_DAY, 23);
		endDateTimeCal.set(Calendar.MINUTE, 59);
		endDateTimeCal.set(Calendar.SECOND, 59);
		endDateTimeCal.set(Calendar.MILLISECOND, 0);

		Date endDateTime = endDateTimeCal.getTime();

		String publicationDateFormatted = dateTimeFormat.format(publicationDate);
		String startDateTimeFormatted = dateTimeFormat.format(startDateTime);
		String endDateTimeFormatted = dateTimeFormat.format(endDateTime);
		int pubYearValue = publicationDateCal.get(Calendar.YEAR);
				
		File file = new File(fileLocaton);

		String fileContext = new String();
		try {
			fileContext = FileUtils.readFileToString(file, "UTF-8");

			fileContext = fileContext.replace("{edition-lower-case}", editionLowerCase)
					.replace("{edition-title-case}", editionTitleCase).replace("{override-issue-isbn}", isbn)
					.replace("{override-publication-date}", publicationDateFormatted)
					.replace("{start-date-time}", startDateTimeFormatted)
					.replace("{end-date-time}", endDateTimeFormatted)
					.replace("{override-issue-number}", issueNumber)
					.replace("{override-page-number}", pageNumber)
					.replace("{pub-year-value}", String.valueOf(pubYearValue));
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return fileContext;
	}
}
