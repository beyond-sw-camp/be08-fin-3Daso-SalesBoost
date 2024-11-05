package beyond.samdasoo.excel.service;

import beyond.samdasoo.common.exception.BaseException;
import beyond.samdasoo.common.response.BaseResponseStatus;
import beyond.samdasoo.excel.dto.ExcelDto;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class ExcelService {
    public byte[] generateExcelFile(ExcelDto excelDto) throws IOException {

        List<Map<String, Object>> tableData = excelDto.getTableData();
        String sheetName = excelDto.getSheetName();

        ByteArrayOutputStream outputStream = null;
        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet(sheetName);

            int rowIndex = 0;
            for (Map<String, Object> rowData : tableData) {
                Row row = sheet.createRow(rowIndex++);
                int cellIndex = 0;
                for (Object value : rowData.values()) {
                    Cell cell = row.createCell(cellIndex++);
                    cell.setCellValue(value.toString());
                }
            }

            outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            return outputStream.toByteArray();

        } catch (IOException e) {
            log.error("엑셀 파일 생성 중에 오류가 발생했습니다.", e);
            throw new BaseException(BaseResponseStatus.UNEXPECTED_ERROR);
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    log.error("출력 스트림을 close 하는데 실패했습니다.", e);
                }
            }
        }
    }

    public byte[] generateExcel(ExcelDto excelDto) throws IOException {
        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet(excelDto.getSheetName());
            List<Map<String, Object>> data = excelDto.getTableData();

            if (data.isEmpty()) {
                return new byte[0];
            }

            // Create header row
            Row headerRow = sheet.createRow(0);
            int headerIndex = 0;
            for (String key : data.get(0).keySet()) {
                Cell cell = headerRow.createCell(headerIndex++);
                cell.setCellValue(key);
                cell.setCellStyle(createHeaderCellStyle(workbook));
            }

            // Populate data rows
            int rowIndex = 1;
            for (Map<String, Object> rowData : data) {
                Row row = sheet.createRow(rowIndex++);
                int cellIndex = 0;
                for (Object value : rowData.values()) {
                    Cell cell = row.createCell(cellIndex++);
                    cell.setCellValue(value != null ? value.toString() : "");
                }
            }

            workbook.write(out);
            return out.toByteArray();
        }
    }

    private CellStyle createHeaderCellStyle(Workbook workbook) {
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);
        return style;
    }
}
