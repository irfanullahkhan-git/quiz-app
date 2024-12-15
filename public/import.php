<?php
$inputFileName = 'quiz_questions.csv'; // Path to your CSV file

// Open the CSV file for reading
if (($handle = fopen($inputFileName, 'r')) !== false) {
    $queries = [];
    $rowNumber = 0;

    // Read each row of the CSV
    while (($row = fgetcsv($handle, 1000, ',')) !== false) {
        $rowNumber++;

        // Skip the header row
        if ($rowNumber === 1) {
            continue;
        }

        // Assign values to variables
        $question = addslashes($row[0]); // Column A: Question
        $optionA = addslashes($row[1]); // Column B: Option A
        $optionB = addslashes($row[2]); // Column C: Option B
        $optionC = addslashes($row[3]); // Column D: Option C
        $optionD = addslashes($row[4]); // Column E: Option D
        $correctOption = addslashes($row[5]); // Column F: Correct Option

        // Create the insert query
        $query = "INSERT INTO quiz_questions (question, option_a, option_b, option_c, option_d, correct_option) 
                  VALUES ('$question', '$optionA', '$optionB', '$optionC', '$optionD', '$correctOption');";

        $queries[] = $query;
    }

    // Close the file
    fclose($handle);

    // Output the generated queries
    foreach ($queries as $query) {
        echo $query . "\n";
    }
} else {
    echo "Error: Unable to open the CSV file.";
}
?>
