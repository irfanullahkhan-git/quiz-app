<?php
require 'custom_libraries/vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Create a new Spreadsheet object
$spreadsheet = new Spreadsheet();

// Set some properties for the Excel file
$spreadsheet->getProperties()
    ->setCreator("Your Name")
    ->setTitle("Sample Excel File")
    ->setDescription("This is a sample Excel file generated using PhpSpreadsheet.");

// Create a new worksheet
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', 'Hello')
    ->setCellValue('B1', 'World');

// Create a writer object to save the Excel file
$writer = new Xlsx($spreadsheet);

// Save the Excel file
$filename = 'sample_excel.xlsx';
$writer->save($filename);

echo "Excel file created successfully: $filename";
?>
