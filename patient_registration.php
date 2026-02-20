<?php

/*
    This PHP script processes patient registration data submitted via a web form
    and stores it in a database. It first creates a user account for the patient(userTypeID:9),
    then utilizes the user ID to store patient details. It establishes a connection
    to the database, validates required input fields, generates a random password,
    hashes it, and inserts user information into the 'users' table. It then retrieves
    the user ID and inserts patient details into the 'patients' table. Any errors
    encountered during the process are reported back to the user.
*/
date_default_timezone_set('Europe/Istanbul');
require_once("db_connect.php");
error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = db_connect();
$tarihVeSaat = date('Y-m-d H:i:s');

if (isset($_POST['name']) && isset($_POST['dateOfBirth'])) {
    $name = $_POST['name'];
    $dateOfBirth = $_POST['dateOfBirth'];
    $contactInfo = $_POST['contactInfo'];
    $address = $_POST['address'];
    $insuranceId = $_POST['insurance'];
    $medicalHistory = $_POST['medicalHistory'];
    $allergies = $_POST['allergies'];
    $bloodTypeId = $_POST['bloodType'];
    $emergencyContact = $_POST['emergencyContact'];
    $username = $_POST['username'];

    if ($conn->connect_error) {
        die("Connection error: " . $conn->connect_error);
    }

    function generateRandomPassword($length = 12) {
        $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()';
        $charactersLength = strlen($characters);
        $randomPassword = '';
        for ($i = 0; $i < $length; $i++) {
            $randomPassword .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomPassword;
    }

    function hashPassword($password) {
        return password_hash($password, PASSWORD_BCRYPT);
    }

    $password = generateRandomPassword();
    $user_password = hashPassword($password);
    $usertypeID = 9;

    $stmt = $conn->prepare("INSERT INTO users (userTypeID, username, password) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $usertypeID, $username, $user_password);
    $stmt->execute();

    $user_id = $conn->insert_id;

    $sql = "INSERT INTO patients (patientID, name, DateOfBirth, ContactInformation, Address, 
                      InsuranceId, MedicalHistory, Allergies, BloodTypeId,
                      emergencyContact, registration_date) 
         VALUES ($user_id, '$name', '$dateOfBirth', '$contactInfo', '$address', 
                 '$insuranceId', '$medicalHistory', '$allergies', '$bloodTypeId',
                 '$emergencyContact', '$tarihVeSaat')";

    if ($conn->query($sql) === TRUE) {
        echo $tarihVeSaat;
    } else {
        echo "Error: " . $conn->error;
    }

    $conn->close();
} else {
    echo "Error: Required data is missing!";
}
?>
