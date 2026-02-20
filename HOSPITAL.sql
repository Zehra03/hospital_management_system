-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 24 May 2024, 08:22:41
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hospital`
--

DELIMITER $$
--
-- İşlevler
--
CREATE DEFINER=`root`@`localhost` FUNCTION `FindAllPreviousAppointments` (`AppointmentID` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE prevAppointmentID INT;
    DECLARE prevAppointments VARCHAR(255) DEFAULT '';
    SET prevAppointmentID = AppointmentID;
    
    WHILE prevAppointmentID IS NOT NULL DO
        SELECT CONCAT(prevAppointments, prevAppointmentID, ',') INTO prevAppointments;
        SELECT PreviousAppointmentID INTO prevAppointmentID FROM Appointments WHERE AppointmentID = prevAppointmentID;
    END WHILE;
    
    RETURN prevAppointments;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FindAllPreviousAppointments2` (`AppointmentID` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE prevAppointmentID INT;
    DECLARE prevAppointments VARCHAR(255) DEFAULT '';
    SET prevAppointmentID = AppointmentID;
    
    WHILE prevAppointmentID IS NOT NULL DO
        SELECT CONCAT(prevAppointments, prevAppointmentID, ',') INTO prevAppointments;
        SELECT PreviousAppointmentID INTO prevAppointmentID FROM Appointments WHERE AppointmentID = prevAppointmentID;
    END WHILE;
    
    RETURN prevAppointments;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FindAllPreviousAppointments3` (`AppointmentID` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE prevAppointmentID INT;
    DECLARE prevAppointments VARCHAR(255) DEFAULT '';
    SET prevAppointmentID = AppointmentID;
    
    WHILE prevAppointmentID IS NOT NULL DO
        SELECT CONCAT(prevAppointments, prevAppointmentID, ',') INTO prevAppointments;
        SELECT PreviousAppointmentID INTO prevAppointmentID FROM Appointments WHERE AppointmentID = prevAppointmentID;
    END WHILE;
    
    RETURN prevAppointments;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FindAllPreviousAppointments4` (`AppointmentID` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE prevAppointmentID INT;
    DECLARE prevAppointments VARCHAR(255) DEFAULT '';
    SET prevAppointmentID = AppointmentID;
    
    WHILE prevAppointmentID IS NOT NULL DO
        SET prevAppointments = CONCAT(prevAppointments, prevAppointmentID, ',');
        SELECT PreviousAppointmentID INTO prevAppointmentID FROM Appointments WHERE AppointmentID = prevAppointmentID;
    END WHILE;
    
    RETURN prevAppointments;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FindPreviousAppointment` (`AppointmentID` INT) RETURNS INT(11)  BEGIN
    DECLARE prevAppointmentID INT;
    
    SET prevAppointmentID = AppointmentID;

    WHILE prevAppointmentID IS NOT NULL DO
        SELECT PreviousAppointmentID INTO prevAppointmentID
        FROM Appointments
        WHERE AppointmentID = prevAppointmentID;
    END WHILE;

    RETURN prevAppointmentID;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FindPreviousAppointmentt` (`AppointmentID` INT) RETURNS INT(11)  BEGIN
    DECLARE prevAppointmentID INT;
    SET prevAppointmentID = AppointmentID;
    
    WHILE prevAppointmentID IS NOT NULL DO
        SELECT PreviousAppointmentID INTO prevAppointmentID FROM Appointments WHERE AppointmentID = prevAppointmentID;
    END WHILE;
    
    RETURN prevAppointmentID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `administrativetasks`
--

CREATE TABLE `administrativetasks` (
  `TaskID` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `Priority` varchar(50) DEFAULT NULL,
  `AssignedStaff` int(11) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `administrativetasks`
--

INSERT INTO `administrativetasks` (`TaskID`, `Description`, `Priority`, `AssignedStaff`, `DueDate`, `Status`) VALUES
(1, 'Schedule staff meetings for next week', 'Medium', 1, '2024-03-20', 'Pending'),
(2, 'Review and update patient admission forms', 'High', 2, '2024-03-18', 'In Progress'),
(3, 'Prepare monthly financial report', 'High', 3, '2024-03-25', 'Pending'),
(4, 'Coordinate training sessions for new hires', 'Medium', 4, '2024-03-22', 'Pending'),
(5, 'Update inventory records for medical supplies', 'High', 5, '2024-03-21', 'In Progress'),
(6, 'Organize community health awareness event', 'High', 6, '2024-04-05', 'Pending'),
(7, 'Review and update employee handbook', 'Medium', 7, '2024-03-23', 'In Progress'),
(8, 'Conduct performance evaluations for staff', 'High', 8, '2024-03-30', 'Pending'),
(9, 'Coordinate equipment maintenance schedule', 'Medium', 9, '2024-03-19', 'In Progress'),
(10, 'Plan staff appreciation day activities', 'Medium', 10, '2024-04-02', 'Pending'),
(11, 'Prepare budget proposal for next fiscal year', 'High', 11, '2024-04-15', 'Pending'),
(12, 'Review and update patient discharge instructions', 'High', 12, '2024-03-20', 'In Progress'),
(13, 'Coordinate guest speaker for staff training', 'Medium', 13, '2024-03-26', 'Pending'),
(14, 'Develop marketing strategy for healthcare services', 'High', 14, '2024-04-10', 'Pending'),
(15, 'Update electronic health record system', 'High', 15, '2024-03-28', 'In Progress'),
(16, 'Organize blood donation drive', 'High', 16, '2024-04-08', 'Pending'),
(17, 'Conduct patient satisfaction surveys', 'Medium', 17, '2024-03-31', 'In Progress'),
(18, 'Plan employee training on new software', 'Medium', 18, '2024-03-27', 'Pending'),
(19, 'Coordinate annual employee health screenings', 'Medium', 19, '2024-04-03', 'In Progress'),
(20, 'Review and update hospital policies', 'High', 20, '2024-04-12', 'Pending');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admissions`
--

CREATE TABLE `admissions` (
  `AdmissionID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `AdmissionDate` date DEFAULT NULL,
  `DischargeDate` date DEFAULT NULL,
  `WardAssigned` int(11) DEFAULT NULL,
  `AdmittingDoctor` int(11) DEFAULT NULL,
  `ReasonForAdmission` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `admissions`
--

INSERT INTO `admissions` (`AdmissionID`, `PatientID`, `AdmissionDate`, `DischargeDate`, `WardAssigned`, `AdmittingDoctor`, `ReasonForAdmission`) VALUES
(1, 1, '2024-03-17', '2024-03-20', 1, 21, 'Hypertensive crisis'),
(2, 2, '2024-03-17', '2024-03-18', 2, 22, 'Pneumonia'),
(3, 3, '2024-03-17', '2024-03-19', 3, 23, 'Diabetic ketoacidosis'),
(4, 4, '2024-03-17', '2024-03-17', 4, 24, 'Dermatitis flare-up'),
(5, 5, '2024-03-17', '2024-03-20', 5, 25, 'Severe migraine'),
(6, 6, '2024-03-17', '2024-03-18', 6, 26, 'Anxiety attack'),
(7, 7, '2024-03-17', '2024-03-19', 7, 27, 'Depressive episode'),
(8, 8, '2024-03-17', '2024-03-17', 8, 28, 'Routine checkup'),
(9, 9, '2024-03-17', '2024-03-18', 9, 29, 'Allergic rhinitis exacerbation'),
(10, 10, '2024-03-17', '2024-03-20', 10, 30, 'Asthma exacerbation'),
(11, 11, '2024-03-17', '2024-03-18', 11, 31, 'Peptic ulcer bleeding'),
(12, 12, '2024-03-17', '2024-03-17', 12, 32, 'Gastritis flare-up'),
(13, 13, '2024-03-17', '2024-03-18', 13, 33, 'Myocardial infarction'),
(14, 14, '2024-03-17', '2024-03-19', 14, 34, 'Tinnitus evaluation'),
(15, 15, '2024-03-17', '2024-03-18', 15, 35, 'Hypothyroidism management'),
(16, 16, '2024-03-17', '2024-03-17', 16, 36, 'Nasal fracture'),
(17, 17, '2024-03-17', '2024-03-18', 17, 37, 'Chronic kidney disease evaluation'),
(18, 18, '2024-03-17', '2024-03-17', 18, 38, 'COPD exacerbation'),
(19, 19, '2024-03-17', '2024-03-18', 19, 39, 'Rheumatoid arthritis flare-up'),
(20, 20, '2024-03-17', '2024-03-20', 20, 40, 'Breast cancer surgery');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `DateAndTime` datetime DEFAULT NULL,
  `AppointmentType` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `initialAppointmentID` int(11) DEFAULT NULL,
  `AppointmentNote` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `appointments`
--

INSERT INTO `appointments` (`AppointmentID`, `PatientID`, `DoctorID`, `DateAndTime`, `AppointmentType`, `Status`, `initialAppointmentID`, `AppointmentNote`) VALUES
(1, 1, 21, '2024-03-17 09:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(2, 2, 22, '2024-03-17 10:00:00', 'Follow-up', 'Scheduled', NULL, NULL),
(3, 3, 23, '2024-03-17 11:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(4, 4, 24, '2024-03-17 12:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(5, 5, 25, '2024-03-17 13:00:00', 'Follow-up', 'Scheduled', NULL, NULL),
(6, 6, 26, '2024-03-17 14:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(7, 7, 27, '2024-03-17 15:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(8, 8, 28, '2024-03-17 16:00:00', 'Follow-up', 'Scheduled', NULL, NULL),
(9, 9, 29, '2024-03-17 17:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(10, 10, 30, '2024-03-17 18:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(11, 11, 31, '2024-03-17 19:00:00', 'Follow-up', 'Scheduled', NULL, NULL),
(12, 12, 32, '2024-03-17 20:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(13, 13, 33, '2024-03-17 21:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(14, 14, 34, '2024-03-17 22:00:00', 'Follow-up', 'Scheduled', NULL, NULL),
(15, 15, 35, '2024-03-17 23:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(16, 16, 36, '2024-03-18 09:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(17, 17, 37, '2024-03-18 10:00:00', 'Follow-up', 'Scheduled', NULL, NULL),
(18, 18, 38, '2024-03-18 11:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(19, 19, 39, '2024-03-18 12:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(20, 20, 40, '2024-03-18 13:00:00', 'Consultation', 'Scheduled', NULL, NULL),
(21, 20, 40, '2024-03-18 14:00:00', 'Follow-up', 'Scheduled', 20, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `billing`
--

CREATE TABLE `billing` (
  `BillID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `billing`
--

INSERT INTO `billing` (`BillID`, `ServiceID`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 1),
(4, 6),
(5, 3),
(5, 7),
(6, 1),
(7, 1),
(7, 2),
(8, 3),
(9, 1),
(9, 5),
(10, 1),
(10, 4),
(11, 3),
(12, 1),
(12, 8),
(13, 1),
(13, 5),
(14, 3),
(15, 1),
(15, 5),
(16, 1),
(16, 9),
(17, 3),
(18, 1),
(19, 1),
(19, 5),
(20, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `billinginfo`
--

CREATE TABLE `billinginfo` (
  `BillID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `PaymentStatus` varchar(255) DEFAULT NULL,
  `PaymentMethod` varchar(255) DEFAULT NULL,
  `BillingDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `billinginfo`
--

INSERT INTO `billinginfo` (`BillID`, `PatientID`, `PaymentStatus`, `PaymentMethod`, `BillingDate`) VALUES
(1, 1, 'Paid', 'Credit Card', '2024-03-17 00:00:00'),
(2, 2, 'Paid', 'Cash', '2024-03-17 00:00:00'),
(3, 3, 'Pending', NULL, '2024-03-17 00:00:00'),
(4, 4, 'Paid', 'Insurance', '2024-03-17 00:00:00'),
(5, 5, 'Pending', NULL, '2024-03-17 00:00:00'),
(6, 6, 'Paid', 'Cash', '2024-03-17 00:00:00'),
(7, 7, 'Pending', NULL, '2024-03-17 00:00:00'),
(8, 8, 'Paid', 'Credit Card', '2024-03-17 00:00:00'),
(9, 9, 'Pending', NULL, '2024-03-17 00:00:00'),
(10, 10, 'Paid', 'Insurance', '2024-03-17 00:00:00'),
(11, 11, 'Paid', 'Cash', '2024-03-17 00:00:00'),
(12, 12, 'Pending', NULL, '2024-03-17 00:00:00'),
(13, 13, 'Paid', 'Credit Card', '2024-03-17 00:00:00'),
(14, 14, 'Pending', NULL, '2024-03-17 00:00:00'),
(15, 15, 'Paid', 'Insurance', '2024-03-17 00:00:00'),
(16, 16, 'Pending', NULL, '2024-03-17 00:00:00'),
(17, 17, 'Paid', 'Cash', '2024-03-17 00:00:00'),
(18, 18, 'Pending', NULL, '2024-03-17 00:00:00'),
(19, 19, 'Paid', 'Credit Card', '2024-03-17 00:00:00'),
(20, 20, 'Pending', NULL, '2024-03-17 00:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bloodtype`
--

CREATE TABLE `bloodtype` (
  `bloodtypeID` int(11) NOT NULL,
  `bloodtype` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `bloodtype`
--

INSERT INTO `bloodtype` (`bloodtypeID`, `bloodtype`) VALUES
(1, 'A+'),
(2, 'A-'),
(3, 'B+'),
(4, 'B-'),
(5, 'AB+'),
(6, 'AB-'),
(7, 'O+'),
(8, 'O-');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `caretype`
--

CREATE TABLE `caretype` (
  `CareTypeID` int(11) NOT NULL,
  `CarePlan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `caretype`
--

INSERT INTO `caretype` (`CareTypeID`, `CarePlan`) VALUES
(25, 'Administer analgesics'),
(21, 'Administer antacids'),
(3, 'Administer antibiotics'),
(15, 'Administer antihistamines'),
(31, 'Administer antihypertensives'),
(17, 'Administer bronchodilators'),
(37, 'Administer chemotherapy'),
(27, 'Administer diuretics'),
(35, 'Administer immunosuppressants'),
(5, 'Administer insulin'),
(33, 'Administer laxatives'),
(2, 'Administer migraine abortive therapy'),
(29, 'Administer nasal decongestants'),
(19, 'Administer proton pump inhibitors'),
(23, 'Administer thrombolytics'),
(14, 'discuss preventive measures'),
(8, 'emollients'),
(12, 'encourage self-care activities'),
(10, 'initiate relaxation techniques'),
(6, 'monitor blood glucose levels'),
(1, 'Monitor blood pressure regularly'),
(36, 'monitor for adverse effects'),
(16, 'monitor for adverse reactions'),
(34, 'monitor for bowel movement'),
(32, 'monitor for BP reduction'),
(28, 'monitor for fluid balance'),
(20, 'monitor for GI bleeding'),
(26, 'monitor for pain relief'),
(30, 'monitor for relief'),
(24, 'monitor for reperfusion'),
(38, 'monitor for side effects'),
(22, 'monitor for symptom relief'),
(11, 'Monitor mood'),
(4, 'monitor respiratory status'),
(18, 'oxygen therapy'),
(9, 'Provide reassurance'),
(13, 'Routine checkup'),
(7, 'Topical corticosteroids');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `DepartmentHeadID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `departments`
--

INSERT INTO `departments` (`DepartmentID`, `DepartmentName`, `Location`, `DepartmentHeadID`) VALUES
(1, 'Internal Medicine', 'Main Building, 3rd Floor', 21),
(2, 'Pediatrics', 'Pediatric Wing, 1st Floor', 22),
(3, 'Surgery', 'Surgical Center, 2nd Floor', 23),
(4, 'Dermatology', 'Dermatology Clinic, 4th Floor', 24),
(5, 'Neurology', 'Neurology Department, 5th Floor', 25),
(6, 'Psychiatry', 'Psychiatry Clinic, 6th Floor', 26),
(7, 'Ophthalmology', 'Ophthalmology Clinic, 7th Floor', 27),
(8, 'Gynecology', 'Gynecology Department, 8th Floor', 28),
(9, 'Endocrinology', 'Endocrinology Clinic, 9th Floor', 29),
(10, 'Urology', 'Urology Clinic, 10th Floor', 30),
(11, 'Gastroenterology', 'Gastroenterology Department, 11th Floor', 31),
(12, 'Otolaryngology', 'ENT Clinic, 12th Floor', 32),
(13, 'Cardiology', 'Cardiology Department, 13th Floor', 33),
(14, 'Plastic Surgery', 'Plastic Surgery Clinic, 14th Floor', 34),
(15, 'Nephrology', 'Nephrology Department, 15th Floor', 35),
(16, 'Pulmonology', 'Pulmonology Clinic, 16th Floor', 36),
(17, 'Rheumatology', 'Rheumatology Department, 17th Floor', 37),
(18, 'Oncology', 'Oncology Clinic, 18th Floor', 38),
(19, 'Hematology', 'Hematology Department, 19th Floor', 39),
(20, 'Radiology', 'Radiology Department, 20th Floor', 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosisID` int(11) NOT NULL,
  `MedicationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `diagnosis`
--

INSERT INTO `diagnosis` (`diagnosisID`, `MedicationID`) VALUES
(1, 1),
(1, 21),
(2, 22),
(3, 3),
(4, 23),
(5, 24),
(6, 9),
(7, 19),
(8, 0),
(9, 25),
(9, 26),
(10, 5),
(10, 12),
(11, 10),
(12, 27),
(12, 28),
(13, 9),
(13, 21),
(14, 0),
(15, 6),
(16, 0),
(17, 35),
(18, 5),
(18, 12),
(19, 29),
(20, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `diagnosisinfo`
--

CREATE TABLE `diagnosisinfo` (
  `diagnosisID` int(11) NOT NULL,
  `DiagnosisName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `diagnosisinfo`
--

INSERT INTO `diagnosisinfo` (`diagnosisID`, `DiagnosisName`) VALUES
(1, 'Hypertension'),
(2, 'Upper respiratory infection'),
(3, 'Type 2 Diabetes'),
(4, 'Dermatitis'),
(5, 'Migraine'),
(6, 'Hyperlipidemia'),
(7, 'Anxiety disorder'),
(8, 'Routine checkup'),
(9, 'Allergic rhinitis'),
(10, 'Asthma exacerbation'),
(11, 'Peptic ulcer disease'),
(12, 'Gastritis'),
(13, 'Coronary artery disease'),
(14, 'Tinnitus'),
(15, 'Hypothyroidism'),
(16, 'Fractured nose'),
(17, 'Chronic kidney disease'),
(18, 'COPD exacerbation'),
(19, 'Rheumatoid arthritis'),
(20, 'Breast cancer');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctors`
--

CREATE TABLE `doctors` (
  `DoctorID` int(11) NOT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `LicenseInformation` varchar(100) DEFAULT NULL,
  `AppointmentSchedule` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `Specialization`, `LicenseInformation`, `AppointmentSchedule`) VALUES
(21, 'Cardiologist', 'License#12345', 'Monday, Wednesday, Friday - 9:00 AM to 5:00 PM'),
(22, 'Pediatrician', 'License#54321', 'Tuesday, Thursday - 9:00 AM to 5:00 PM'),
(23, 'Orthopedic Surgeon', 'License#67890', 'Monday to Friday - 8:00 AM to 4:00 PM'),
(24, 'Dermatologist', 'License#13579', 'Monday to Friday - 10:00 AM to 6:00 PM'),
(25, 'Neurologist', 'License#97531', 'Monday, Wednesday, Friday - 8:00 AM to 4:00 PM'),
(26, 'Psychiatrist', 'License#24680', 'Tuesday, Thursday - 10:00 AM to 6:00 PM'),
(27, 'Ophthalmologist', 'License#86420', 'Monday to Friday - 9:00 AM to 5:00 PM'),
(28, 'Gynecologist', 'License#35791', 'Monday to Friday - 8:00 AM to 4:00 PM'),
(29, 'Endocrinologist', 'License#80246', 'Monday to Friday - 9:00 AM to 5:00 PM'),
(30, 'Urologist', 'License#86420', 'Monday, Wednesday, Friday - 10:00 AM to 6:00 PM'),
(31, 'Gastroenterologist', 'License#97531', 'Tuesday, Thursday - 8:00 AM to 4:00 PM'),
(32, 'Otolaryngologist', 'License#24680', 'Monday to Friday - 10:00 AM to 6:00 PM'),
(33, 'Cardiothoracic Surgeon', 'License#13579', 'Monday to Friday - 8:00 AM to 4:00 PM'),
(34, 'Plastic Surgeon', 'License#86420', 'Monday to Friday - 9:00 AM to 5:00 PM'),
(35, 'Nephrologist', 'License#97531', 'Monday to Friday - 8:00 AM to 4:00 PM'),
(36, 'Pulmonologist', 'License#24680', 'Monday, Wednesday, Friday - 10:00 AM to 6:00 PM'),
(37, 'Rheumatologist', 'License#35791', 'Tuesday, Thursday - 9:00 AM to 5:00 PM'),
(38, 'Oncologist', 'License#80246', 'Monday to Friday - 8:00 AM to 4:00 PM'),
(39, 'Hematologist', 'License#97531', 'Monday to Friday - 9:00 AM to 5:00 PM'),
(40, 'Radiologist', 'License#13579', 'Monday to Friday - 8:00 AM to 4:00 PM');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `facilitymanagement`
--

CREATE TABLE `facilitymanagement` (
  `FacilityID` int(11) NOT NULL,
  `MaintenanceRecords` text DEFAULT NULL,
  `EquipmentInventory` text DEFAULT NULL,
  `SecurityLogs` text DEFAULT NULL,
  `CleaningSchedules` text DEFAULT NULL,
  `UtilitiesUsage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `facilitymanagement`
--

INSERT INTO `facilitymanagement` (`FacilityID`, `MaintenanceRecords`, `EquipmentInventory`, `SecurityLogs`, `CleaningSchedules`, `UtilitiesUsage`) VALUES
(1, 'HVAC system serviced on 2024-03-15', 'Medical equipment inventory updated', 'Security cameras operational', 'Daily cleaning schedule followed', 'Electricity usage monitored daily'),
(2, 'Plumbing system inspected on 2024-03-16', 'Surgical instruments inventory updated', 'Visitor log maintained', 'Weekly deep cleaning conducted', 'Water usage monitored daily'),
(3, 'Fire safety equipment tested on 2024-03-15', 'Diagnostic equipment inventory updated', 'Access control logs reviewed', 'Monthly maintenance of floors', 'Gas usage monitored weekly'),
(4, 'Emergency lighting system checked on 2024-03-16', 'Patient monitoring equipment inventory updated', 'Incident reports filed', 'Bi-weekly sanitation of patient rooms', 'Internet usage monitored daily'),
(5, 'Elevator maintenance completed on 2024-03-17', 'Rehabilitation equipment inventory updated', 'Parking lot patrolled regularly', 'Daily disinfection of common areas', 'Phone usage monitored daily'),
(6, 'Roof inspection conducted on 2024-03-16', 'Pharmacy inventory updated', 'Alarm system tested', 'Weekly cleaning of administrative offices', 'Water usage monitored daily'),
(7, 'Grounds maintenance performed on 2024-03-17', 'Laboratory equipment inventory updated', 'Emergency exit drills conducted', 'Daily cleaning of restrooms', 'Electricity usage monitored daily'),
(8, 'Pest control services rendered on 2024-03-16', 'Radiology equipment inventory updated', 'Security breaches investigated', 'Bi-weekly sanitation of kitchen areas', 'Gas usage monitored weekly'),
(9, 'Security system upgraded on 2024-03-17', 'Physical therapy equipment inventory updated', 'Access control system audited', 'Daily cleaning of waiting areas', 'Internet usage monitored daily'),
(10, 'Generator tested on 2024-03-16', 'Dialysis equipment inventory updated', 'Incident response training conducted', 'Weekly cleaning of corridors', 'Phone usage monitored daily');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `insurance`
--

CREATE TABLE `insurance` (
  `InsuranceID` int(11) NOT NULL,
  `InsuranceInformation` varchar(255) DEFAULT NULL,
  `InsuranceCompany` varchar(255) DEFAULT NULL,
  `PolicyNumber` varchar(50) DEFAULT NULL,
  `CoverageType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `insurance`
--

INSERT INTO `insurance` (`InsuranceID`, `InsuranceInformation`, `InsuranceCompany`, `PolicyNumber`, `CoverageType`) VALUES
(1, 'ABC Insurance, Policy#12345', 'ABC Insurance', '12345', 'Health'),
(2, 'XYZ Insurance, Policy#54321', 'XYZ Insurance', '54321', 'Health'),
(3, 'DEF Insurance, Policy#67890', 'DEF Insurance', '67890', 'Health'),
(4, 'GHI Insurance, Policy#13579', 'GHI Insurance', '13579', 'Health'),
(5, 'JKL Insurance, Policy#97531', 'JKL Insurance', '97531', 'Health'),
(6, 'MNO Insurance, Policy#24680', 'MNO Insurance', '24680', 'Health'),
(7, 'PQR Insurance, Policy#86420', 'PQR Insurance', '86420', 'Health'),
(8, 'STU Insurance, Policy#75309', 'STU Insurance', '75309', 'Health'),
(9, 'VWX Insurance, Policy#35791', 'VWX Insurance', '35791', 'Health'),
(10, 'YZ Insurance, Policy#80246', 'YZ Insurance', '80246', 'Health'),
(11, 'ABC Insurance, Policy#24680', 'ABC Insurance', '24680', 'Health'),
(12, 'DEF Insurance, Policy#97531', 'DEF Insurance', '97531', 'Health'),
(14, 'XYZ Insurance, Policy#80246', 'XYZ Insurance', '80246', 'Health'),
(16, 'JKL Insurance, Policy#86420', 'JKL Insurance', '86420', 'Health'),
(17, 'MNO Insurance, Policy#12345', 'MNO Insurance', '12345', 'Health'),
(18, 'PQR Insurance, Policy#24680', 'PQR Insurance', '24680', 'Health'),
(19, 'STU Insurance, Policy#80246', 'STU Insurance', '80246', 'Health'),
(20, 'YZ Insurance, Policy#97531', 'YZ Insurance', '97531', 'Health');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `inventory`
--

CREATE TABLE `inventory` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `SupplierInformation` varchar(100) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `StockLevel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `inventory`
--

INSERT INTO `inventory` (`ItemID`, `ItemName`, `Quantity`, `SupplierInformation`, `ExpiryDate`, `Location`, `StockLevel`) VALUES
(1, 'Aspirin', 500, 'ABC Pharma', '2025-12-31', 'Main Pharmacy', 400),
(2, 'Acetaminophen', 300, 'XYZ Pharma', '2024-10-31', 'Main Pharmacy', 250),
(3, 'Metformin', 200, 'DEF Pharma', '2023-05-31', 'Main Pharmacy', 180),
(4, 'Hydrocortisone cream', 100, 'GHI Pharma', '2023-08-31', 'Dermatology Department', 80),
(5, 'Sumatriptan', 150, 'JKL Pharma', '2024-04-30', 'Neurology Department', 120),
(6, 'Atorvastatin', 400, 'MNO Pharma', '2023-11-30', 'Main Pharmacy', 350),
(7, 'Sertraline', 200, 'PQR Pharma', '2024-09-30', 'Psychiatry Department', 150),
(8, 'Cetirizine', 300, 'STU Pharma', '2025-02-28', 'Main Pharmacy', 250),
(9, 'Albuterol', 250, 'VWX Pharma', '2023-07-31', 'Pulmonology Department', 200),
(10, 'Omeprazole', 400, 'YZ Pharma', '2024-03-31', 'Gastroenterology Department', 350),
(11, 'Famotidine', 300, 'ABC Pharma', '2025-06-30', 'Gastroenterology Department', 250),
(12, 'Levothyroxine', 200, 'JKL Pharma', '2024-12-31', 'Endocrinology Department', 180),
(13, 'Aspirin', 500, 'ABC Pharma', '2025-12-31', 'Main Pharmacy', 400),
(14, 'Acetaminophen', 300, 'XYZ Pharma', '2024-10-31', 'Main Pharmacy', 250),
(15, 'Metformin', 200, 'DEF Pharma', '2023-05-31', 'Main Pharmacy', 180),
(16, 'Hydrocortisone cream', 100, 'GHI Pharma', '2023-08-31', 'Dermatology Department', 80),
(17, 'Sumatriptan', 150, 'JKL Pharma', '2024-04-30', 'Neurology Department', 120),
(18, 'Atorvastatin', 400, 'MNO Pharma', '2023-11-30', 'Main Pharmacy', 350),
(19, 'Sertraline', 200, 'PQR Pharma', '2024-09-30', 'Psychiatry Department', 150),
(20, 'Cetirizine', 300, 'STU Pharma', '2025-02-28', 'Main Pharmacy', 250);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `itemsservices`
--

CREATE TABLE `itemsservices` (
  `ServiceID` int(11) NOT NULL,
  `ItemServiceRendered` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `itemsservices`
--

INSERT INTO `itemsservices` (`ServiceID`, `ItemServiceRendered`, `Amount`) VALUES
(1, 'Consultation fee', 100.00),
(2, 'Prescription', 50.00),
(3, 'Follow-up visit', 80.00),
(4, 'Medication', 100.00),
(5, 'Lab tests', 150.00),
(6, 'Dermatology treatment', 80.00),
(7, 'Prescription refill', 40.00),
(8, 'Endoscopy', 200.00),
(9, 'Nasal packing', 80.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `labtechnician`
--

CREATE TABLE `labtechnician` (
  `LabTechnicianID` int(11) NOT NULL,
  `LabTechnicianSpecialization` varchar(255) DEFAULT NULL,
  `LabTechnicianCertifications` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `labtechnician`
--

INSERT INTO `labtechnician` (`LabTechnicianID`, `LabTechnicianSpecialization`, `LabTechnicianCertifications`) VALUES
(41, '', ''),
(42, '', ''),
(43, '', ''),
(44, '', ''),
(45, '', ''),
(46, '', ''),
(47, '', ''),
(48, '', ''),
(49, '', ''),
(50, '', ''),
(51, '', ''),
(52, '', ''),
(54, '', ''),
(55, '', ''),
(56, '', ''),
(57, '', ''),
(58, '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `labtests`
--

CREATE TABLE `labtests` (
  `TestID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `TestResults` text DEFAULT NULL,
  `TestStatus` varchar(50) DEFAULT NULL,
  `LabTechnicianID` int(11) DEFAULT NULL,
  `TestTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `labtests`
--

INSERT INTO `labtests` (`TestID`, `PatientID`, `DoctorID`, `DateTime`, `TestResults`, `TestStatus`, `LabTechnicianID`, `TestTypeID`) VALUES
(1, 1, 23, '2024-03-17 08:00:00', 'Normal', 'Completed', 41, 1),
(2, 2, 24, '2024-03-17 09:00:00', 'Abnormal', 'Completed', 42, 2),
(3, 3, 25, '2024-03-17 10:00:00', 'No fractures detected', 'Completed', 43, 3),
(4, 4, 26, '2024-03-17 11:00:00', 'Localized inflammation', 'Completed', 44, 4),
(5, 5, 27, '2024-03-17 12:00:00', 'Abnormal brain waves', 'Completed', 45, 5),
(6, 6, 28, '2024-03-17 13:00:00', 'Normal', 'Completed', 46, 6),
(7, 7, 29, '2024-03-17 14:00:00', 'Sinus rhythm', 'Completed', 47, 7),
(8, 8, 30, '2024-03-17 15:00:00', 'Benign polyps found', 'Completed', 48, 8),
(9, 9, 31, '2024-03-17 16:00:00', 'Localized tumor detected', 'Completed', 49, 9),
(10, 10, 32, '2024-03-17 17:00:00', 'No signs of metastasis', 'Completed', 50, 10),
(11, 11, 33, '2024-03-17 18:00:00', 'Anemia detected', 'Completed', 51, 1),
(12, 12, 34, '2024-03-17 19:00:00', 'Normal', 'Completed', 52, 2),
(13, 13, 35, '2024-03-17 20:00:00', 'Fracture detected', 'Completed', 44, 3),
(14, 14, 36, '2024-03-17 21:00:00', 'No abnormalities found', 'Completed', 54, 4),
(15, 15, 37, '2024-03-17 22:00:00', 'Normal brain activity', 'Completed', 55, 5),
(16, 16, 38, '2024-03-17 23:00:00', 'Polyp detected', 'Completed', 48, 6),
(17, 17, 39, '2024-03-18 08:00:00', 'Tachycardia', 'Completed', 56, 7),
(18, 18, 40, '2024-03-18 09:00:00', 'Diverticulosis found', 'Completed', 45, 8),
(19, 19, 21, '2024-03-18 10:00:00', 'Localized tumor detected', 'Completed', 54, 9),
(20, 20, 22, '2024-03-18 11:00:00', 'Metastasis detected', 'Completed', 55, 10),
(21, 1, 21, '2024-03-17 08:00:00', NULL, 'Not Yet Done', 41, 11),
(22, 1, 21, '2024-03-17 09:00:00', NULL, 'Not Yet Done', 43, 12),
(23, 3, 23, '2024-03-17 10:00:00', NULL, 'Not Yet Done', 42, 13),
(24, 3, 23, '2024-03-17 11:00:00', NULL, 'Not Yet Done', 45, 14),
(25, 4, 24, '2024-03-17 12:00:00', NULL, 'Not Yet Done', 47, 15),
(27, 6, 26, '2024-03-17 14:00:00', NULL, 'Not Yet Done', 48, 12),
(30, 9, 29, '2024-03-17 17:00:00', NULL, 'Not Yet Done', 51, 16),
(31, 10, 30, '2024-03-17 18:00:00', NULL, 'Not Yet Done', 52, 17),
(32, 11, 31, '2024-03-17 19:00:00', NULL, 'Not Yet Done', 43, 18),
(33, 12, 32, '2024-03-17 20:00:00', NULL, 'Not Yet Done', 54, 19),
(34, 13, 33, '2024-03-17 21:00:00', NULL, 'Not Yet Done', 55, 20),
(35, 13, 33, '2024-03-17 22:00:00', NULL, 'Not Yet Done', 42, 21),
(36, 14, 34, '2024-03-17 23:00:00', NULL, 'Not Yet Done', 41, 22),
(37, 15, 35, '2024-03-18 08:00:00', NULL, 'Not Yet Done', 43, 23),
(38, 16, 36, '2024-03-18 09:00:00', NULL, 'Not Yet Done', 45, 3),
(39, 17, 37, '2024-03-18 10:00:00', NULL, 'Not Yet Done', 46, 24),
(40, 18, 38, '2024-03-18 11:00:00', NULL, 'Not Yet Done', 47, 17),
(41, 19, 39, '2024-03-18 12:00:00', NULL, 'Not Yet Done', 48, 25),
(42, 19, 39, '2024-03-18 13:00:00', NULL, 'Not Yet Done', 49, 26),
(43, 20, 40, '2024-03-18 14:00:00', NULL, 'Not Yet Done', 50, 27),
(44, 20, 40, '2024-03-18 15:00:00', NULL, 'Not Yet Done', 51, 28);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `medicalrecords`
--

CREATE TABLE `medicalrecords` (
  `RecordID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `DateOfVisit` date DEFAULT NULL,
  `TreatmentPlan` text DEFAULT NULL,
  `LabTestOrderID` int(11) DEFAULT NULL,
  `DiagnosisID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `medicalrecords`
--

INSERT INTO `medicalrecords` (`RecordID`, `PatientID`, `DoctorID`, `DateOfVisit`, `TreatmentPlan`, `LabTestOrderID`, `DiagnosisID`) VALUES
(1, 1, 21, '2024-03-17', 'Prescription for blood pressure medication', 21, 1),
(2, 1, 21, '2024-03-17', 'Prescription for blood pressure medication', 22, 1),
(3, 1, 22, '2024-03-17', 'Rest, plenty of fluids', NULL, 2),
(4, 3, 23, '2024-03-17', 'Dietary changes, exercise regimen', 23, 3),
(5, 3, 23, '2024-03-17', 'Dietary changes, exercise regimen', 24, 3),
(6, 4, 24, '2024-03-17', 'Topical steroid cream', 25, 4),
(7, 5, 25, '2024-03-17', 'Prescription for migraine medication', NULL, 5),
(8, 6, 26, '2024-03-17', 'Cholesterol-lowering medication', 27, 6),
(9, 7, 27, '2024-03-17', 'Counseling, medication', NULL, 7),
(10, 8, 28, '2024-03-17', 'No treatment required', NULL, 8),
(11, 9, 29, '2024-03-17', 'Antihistamines, nasal spray', 30, 9),
(12, 10, 30, '2024-03-17', 'Bronchodilators, corticosteroids', 31, 10),
(13, 11, 31, '2024-03-17', 'Proton pump inhibitors, dietary modifications', 32, 11),
(14, 12, 32, '2024-03-17', 'Antacids, dietary modifications', 33, 12),
(15, 13, 33, '2024-03-17', 'Aspirin, statin therapy', 34, 13),
(16, 13, 33, '2024-03-17', 'Aspirin, statin therapy', 35, 13),
(17, 14, 34, '2024-03-17', 'Hearing aids, sound therapy', 36, 14),
(18, 15, 35, '2024-03-17', 'Thyroid hormone replacement therapy', 37, 15),
(19, 16, 36, '2024-03-17', 'Closed reduction, nasal packing', 38, 16),
(20, 17, 37, '2024-03-17', 'Blood pressure control, dietary modifications', 39, 17),
(21, 18, 38, '2024-03-17', 'Bronchodilators, corticosteroids', 40, 18),
(22, 19, 39, '2024-03-17', 'Disease-modifying antirheumatic drugs', 41, 19),
(23, 19, 39, '2024-03-17', 'Disease-modifying antirheumatic drugs', 42, 19),
(24, 20, 40, '2024-03-17', 'Surgery, chemotherapy, radiation therapy', 43, 20),
(25, 20, 40, '2024-03-17', 'Surgery, chemotherapy, radiation therapy', 44, 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nurse`
--

CREATE TABLE `nurse` (
  `NurseID` int(11) NOT NULL,
  `NurseSpecialization` varchar(255) DEFAULT NULL,
  `NurseCertifications` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `nurse`
--

INSERT INTO `nurse` (`NurseID`, `NurseSpecialization`, `NurseCertifications`) VALUES
(1, '', ''),
(2, '', ''),
(3, '', ''),
(4, '', ''),
(5, '', ''),
(7, '', ''),
(8, '', ''),
(9, '', ''),
(10, '', ''),
(11, '', ''),
(12, '', ''),
(13, '', ''),
(14, '', ''),
(15, '', ''),
(16, '', ''),
(17, '', ''),
(18, '', ''),
(19, '', ''),
(53, '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patientcare`
--

CREATE TABLE `patientcare` (
  `NursingNotes` text DEFAULT NULL,
  `VitalSigns` text DEFAULT NULL,
  `MedicationAdministrationRecords` text DEFAULT NULL,
  `ProgressReports` text DEFAULT NULL,
  `admissionID` int(11) NOT NULL,
  `CareTypeID` int(11) NOT NULL,
  `CareProviderID` int(11) DEFAULT NULL,
  `RecordedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `patientcare`
--

INSERT INTO `patientcare` (`NursingNotes`, `VitalSigns`, `MedicationAdministrationRecords`, `ProgressReports`, `admissionID`, `CareTypeID`, `CareProviderID`, `RecordedAt`) VALUES
('Patient is responsive and cooperative', 'BP: 120/80, HR: 70 bpm, Temp: 98.6°F', 'Administered medications as prescribed', 'Stable condition, improving', 1, 1, 3, NULL),
('Patient is coughing with sputum production', 'RR: 22 bpm, SpO2: 95%', 'Administered antibiotics via IV', 'Improved oxygen saturation, less coughing', 2, 3, 1, NULL),
('Patient is coughing with sputum production', 'RR: 22 bpm, SpO2: 95%', 'Administered antibiotics via IV', 'Improved oxygen saturation, less coughing', 2, 4, 14, NULL),
('Patient is drowsy and confused', 'BG: 400 mg/dL, Alert and oriented x3', 'Administered insulin subcutaneously', 'Blood glucose levels decreasing, alertness improving', 3, 5, 12, NULL),
('Patient is drowsy and confused', 'BG: 400 mg/dL, Alert and oriented x3', 'Administered insulin subcutaneously', 'Blood glucose levels decreasing, alertness improving', 3, 6, 15, NULL),
('Patient has pruritic rash on extremities', 'Skin warm to touch, erythematous rash present', 'Applied topical corticosteroid cream', 'Reduced erythema and itching', 4, 7, 1, NULL),
('Patient has pruritic rash on extremities', 'Skin warm to touch, erythematous rash present', 'Applied topical corticosteroid cream', 'Reduced erythema and itching', 4, 8, 15, NULL),
('Patient reports severe throbbing headache', 'BP: 140/90, HR: 80 bpm', 'Administered sumatriptan injection', 'Headache intensity reduced, patient resting comfortably', 5, 2, 16, NULL),
('Patient is anxious and restless', 'BP: 130/80, HR: 90 bpm', 'Administered lorazepam orally', 'Reduced anxiety, patient appears calmer', 6, 9, 17, NULL),
('Patient is anxious and restless', 'BP: 130/80, HR: 90 bpm', 'Administered lorazepam orally', 'Reduced anxiety, patient appears calmer', 6, 10, 15, NULL),
('Patient appears withdrawn and tearful', 'Alert and oriented x3, Tearful affect noted', 'Engaged patient in self-care activities', 'Mood slightly improved, patient more interactive', 7, 11, 5, NULL),
('Patient appears withdrawn and tearful', 'Alert and oriented x3, Tearful affect noted', 'Engaged patient in self-care activities', 'Mood slightly improved, patient more interactive', 7, 12, 19, NULL),
('Patient reports no significant complaints', 'BP: 120/80, HR: 70 bpm', 'No medications administered', 'Patient appears well, no acute concerns', 8, 13, 5, NULL),
('Patient reports no significant complaints', 'BP: 120/80, HR: 70 bpm', 'No medications administered', 'Patient appears well, no acute concerns', 8, 14, 3, NULL),
('Patient has nasal congestion and sneezing', 'RR: 18 bpm, SpO2: 98%', 'Administered cetirizine orally', 'Symptoms relieved, no adverse reactions observed', 9, 15, 18, NULL),
('Patient has nasal congestion and sneezing', 'RR: 18 bpm, SpO2: 98%', 'Administered cetirizine orally', 'Symptoms relieved, no adverse reactions observed', 9, 16, 4, NULL),
('Patient reports dyspnea and wheezing', 'RR: 24 bpm, SpO2: 88%', 'Administered albuterol nebulization', 'Improved oxygen saturation, reduced wheezing', 10, 17, 5, NULL),
('Patient reports dyspnea and wheezing', 'RR: 24 bpm, SpO2: 88%', 'Administered albuterol nebulization', 'Improved oxygen saturation, reduced wheezing', 10, 18, 11, NULL),
('Patient reports melena and epigastric pain', 'BP: 140/90, HR: 80 bpm', 'Administered omeprazole intravenously', 'Pain reduced, no further bleeding observed', 11, 19, 2, NULL),
('Patient reports melena and epigastric pain', 'BP: 140/90, HR: 80 bpm', 'Administered omeprazole intravenously', 'Pain reduced, no further bleeding observed', 11, 20, 13, NULL),
('Patient reports epigastric discomfort', 'BP: 130/80, HR: 90 bpm', 'Administered aluminum hydroxide orally', 'Symptoms alleviated, patient comfortable', 12, 21, 3, NULL),
('Patient reports epigastric discomfort', 'BP: 130/80, HR: 90 bpm', 'Administered aluminum hydroxide orally', 'Symptoms alleviated, patient comfortable', 12, 22, 14, NULL),
('Patient reports chest pain and diaphoresis', 'BP: 120/80, HR: 70 bpm', 'Administered alteplase intravenously', 'Chest pain resolved, EKG changes improved', 13, 23, 2, NULL),
('Patient reports chest pain and diaphoresis', 'BP: 120/80, HR: 70 bpm', 'Administered alteplase intravenously', 'Chest pain resolved, EKG changes improved', 13, 24, 8, NULL),
('Patient reports dull aching pain in ear', 'BP: 130/80, HR: 90 bpm', 'Administered acetaminophen orally', 'Pain reduced, patient resting comfortably', 14, 25, 14, NULL),
('Patient reports dull aching pain in ear', 'BP: 130/80, HR: 90 bpm', 'Administered acetaminophen orally', 'Pain reduced, patient resting comfortably', 14, 26, 7, NULL),
('Patient reports lower extremity swelling', 'BP: 140/90, HR: 80 bpm', 'Administered furosemide intravenously', 'Reduced edema, improved fluid balance', 15, 27, 13, NULL),
('Patient reports lower extremity swelling', 'BP: 140/90, HR: 80 bpm', 'Administered furosemide intravenously', 'Reduced edema, improved fluid balance', 15, 28, 3, NULL),
('Patient reports nasal obstruction and epistaxis', 'BP: 120/80, HR: 70 bpm', 'Administered oxymetazoline nasal spray', 'Nasal patency improved, bleeding stopped', 16, 29, 15, NULL),
('Patient reports nasal obstruction and epistaxis', 'BP: 120/80, HR: 70 bpm', 'Administered oxymetazoline nasal spray', 'Nasal patency improved, bleeding stopped', 16, 30, 7, NULL),
('Patient reports headache and palpitations', 'BP: 160/100, HR: 85 bpm', 'Administered lisinopril orally', 'BP decreased, headache relieved', 17, 31, 9, NULL),
('Patient reports headache and palpitations', 'BP: 160/100, HR: 85 bpm', 'Administered lisinopril orally', 'BP decreased, headache relieved', 17, 32, 5, NULL),
('Patient reports constipation and abdominal discomfort', 'BP: 130/80, HR: 90 bpm', 'Administered polyethylene glycol orally', 'Improved bowel movement, discomfort alleviated', 18, 33, 14, NULL),
('Patient reports constipation and abdominal discomfort', 'BP: 130/80, HR: 90 bpm', 'Administered polyethylene glycol orally', 'Improved bowel movement, discomfort alleviated', 18, 34, 19, NULL),
('Patient reports joint pain and swelling', 'BP: 120/80, HR: 70 bpm', 'Administered methotrexate orally', 'Reduced joint inflammation, no adverse effects observed', 19, 35, 15, NULL),
('Patient reports joint pain and swelling', 'BP: 120/80, HR: 70 bpm', 'Administered methotrexate orally', 'Reduced joint inflammation, no adverse effects observed', 19, 36, 17, NULL),
('Patient reports breast tenderness and fatigue', 'BP: 140/90, HR: 80 bpm', 'Administered docetaxel intravenously', 'Managed side effects, patient tolerating treatment well', 20, 37, 19, NULL),
('Patient reports breast tenderness and fatigue', 'BP: 140/90, HR: 80 bpm', 'Administered docetaxel intravenously', 'Managed side effects, patient tolerating treatment well', 20, 38, 5, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patients`
--

CREATE TABLE `patients` (
  `patientId` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `InsuranceId` int(11) DEFAULT NULL,
  `MedicalHistory` text DEFAULT NULL,
  `Allergies` text DEFAULT NULL,
  `EmergencyContact` varchar(100) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `bloodtypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `patients`
--

INSERT INTO `patients` (`patientId`, `Name`, `DateOfBirth`, `ContactInformation`, `Address`, `InsuranceId`, `MedicalHistory`, `Allergies`, `EmergencyContact`, `registration_date`, `bloodtypeID`) VALUES
(1, 'John Doe', '1980-05-15', '123-456-7890', '123 Main St, City, Country', 1, 'None', 'Peanuts', '5551234567', '2024-05-10 04:50:02', NULL),
(2, 'Jane Smith', '1975-10-20', '987-654-3210', '456 Oak St, City, Country', 2, 'High blood pressure', 'None', '5559876543', '2024-05-10 15:39:10', NULL),
(3, 'Emily Johnson', '1990-03-08', '555-123-4567', '789 Elm St, City, Country', 3, 'Diabetes', 'Shellfish', '5551112233', '2024-05-10 07:28:30', NULL),
(4, 'Michael Brown', '1988-12-01', '222-333-4444', '321 Maple St, City, Country', 4, 'Asthma', 'Pollen', '5554445566', '2024-05-10 14:43:33', NULL),
(5, 'Jessica Lee', '1982-07-25', '333-222-1111', '555 Pine St, City, Country', 5, 'None', 'Dust', '5557778899', '2024-05-11 10:51:40', NULL),
(6, 'Daniel Wilson', '1970-09-18', '777-888-9999', '777 Cedar St, City, Country', 6, 'High cholesterol', 'Penicillin', '5556667788', '2024-05-11 11:40:12', NULL),
(7, 'Olivia Taylor', '1985-06-30', '111-222-3333', '888 Walnut St, City, Country', 7, 'Migraines', 'Eggs', '5553332211', '2024-05-11 12:40:23', NULL),
(8, 'Andrew Martinez', '1995-01-12', '999-888-7777', '999 Oakwood St, City, Country', 8, 'None', 'None', '5559998877', NULL, NULL),
(9, 'Sophia Hernandez', '1987-04-05', '444-555-6666', '444 Elmwood St, City, Country', 9, 'Allergies', 'Peanuts', '5552223344', NULL, NULL),
(10, 'William Garcia', '1992-11-24', '666-777-8888', '666 Maplewood St, City, Country', 10, 'Asthma', 'Shellfish', '5558887766', NULL, NULL),
(11, 'Ethan Rodriguez', '1983-08-17', '333-444-5555', '123 Oakwood St, City, Country', 11, 'High blood pressure', 'None', '5556677889', NULL, NULL),
(12, 'Ava Martinez', '1997-02-09', '888-999-0000', '789 Pine St, City, Country', 12, 'None', 'Pollen', '5555544332', NULL, NULL),
(13, 'Sophia Hernandez', '1987-04-05', '444-555-6666', '444 Elmwood St, City, Country', 9, 'Allergies', 'Peanuts', '5559988776', NULL, NULL),
(14, 'Benjamin Diaz', '1978-11-30', '222-333-4444', '222 Maple St, City, Country', 14, 'Diabetes', 'Pollen', '5551122334', NULL, NULL),
(15, 'Emma Perez', '1980-09-14', '555-666-7777', '555 Walnut St, City, Country', 4, 'None', 'Dust', '5558877665', NULL, NULL),
(16, 'James Lopez', '1976-07-02', '777-888-9999', '777 Cedar St, City, Country', 16, 'High cholesterol', 'Penicillin', '5552233441', NULL, NULL),
(17, 'Mia Gonzalez', '1990-12-18', '111-222-3333', '888 Elm St, City, Country', 17, 'Migraines', 'Eggs', '5556677889', NULL, NULL),
(18, 'Lucas Martin', '1984-05-23', '999-888-7777', '999 Oak St, City, Country', 18, 'None', 'None', '5551122334', NULL, NULL),
(19, 'Isabella Adams', '1989-03-07', '555-444-3333', '555 Pine St, City, Country', 19, 'Allergies', 'Peanuts', '5558899776', NULL, NULL),
(20, 'Alexander Clark', '1981-08-10', '666-555-4444', '666 Cedar St, City, Country', 20, 'Asthma', 'Shellfish', '5554455667', NULL, NULL),
(42, 'Betül Demirci', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-10 04:50:02', NULL),
(43, 'Hilal Özkan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-10 15:39:10', NULL),
(44, 'Hicran Özdemir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-10 07:28:30', NULL),
(45, 'Ahmet Aslan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-10 14:43:33', NULL),
(118, 'akın tatar', '2024-05-01', '111111', 'antalya', 1, 'none', 'none', '2222', '2024-05-15 16:51:40', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pharmacy`
--

CREATE TABLE `pharmacy` (
  `MedicationID` int(11) NOT NULL,
  `MedicationName` varchar(100) DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `PrescriptionInformation` text DEFAULT NULL,
  `DispensingPharmacist` varchar(100) DEFAULT NULL,
  `RefillInformation` text DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `ManufacturerInformation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `pharmacy`
--

INSERT INTO `pharmacy` (`MedicationID`, `MedicationName`, `Dosage`, `PrescriptionInformation`, `DispensingPharmacist`, `RefillInformation`, `ExpiryDate`, `ManufacturerInformation`) VALUES
(0, 'N/A', NULL, NULL, NULL, NULL, NULL, NULL),
(1, 'Lisinopril', '10 mg', 'Take one tablet daily', 'John Smith', 'Refillable', '2025-03-01', 'ABC Pharmaceuticals'),
(2, 'Amoxicillin', '500 mg', 'Take one capsule every 8 hours', 'Emily Johnson', 'Refillable with doctor approval', '2025-04-01', 'XYZ Pharmaceuticals'),
(3, 'Metformin', '1000 mg', 'Take one tablet twice daily with meals', 'Michael Williams', 'Refillable', '2025-03-01', 'DEF Pharmaceuticals'),
(4, 'Simvastatin', '20 mg', 'Take one tablet daily in the evening', 'Jessica Brown', 'Refillable', '2025-04-01', 'GHI Pharmaceuticals'),
(5, 'Albuterol', '90 mcg', 'Inhale two puffs every 4-6 hours as needed', 'Daniel Miller', 'Refillable with doctor approval', '2025-03-01', 'JKL Pharmaceuticals'),
(6, 'Levothyroxine', '100 mcg', 'Take one tablet daily on an empty stomach', 'Olivia Wilson', 'Refillable', '2025-03-01', 'MNO Pharmaceuticals'),
(7, 'Warfarin', '5 mg', 'Take one tablet daily as directed by physician', 'James Martinez', 'Refillable with doctor approval', '2025-04-01', 'PQR Pharmaceuticals'),
(8, 'Losartan', '50 mg', 'Take one tablet daily', 'Sophia Rodriguez', 'Refillable', '2025-03-01', 'STU Pharmaceuticals'),
(9, 'Atorvastatin', '40 mg', 'Take one tablet daily in the evening', 'William Garcia', 'Refillable', '2025-03-01', 'VWX Pharmaceuticals'),
(10, 'Omeprazole', '20 mg', 'Take one capsule daily before breakfast', 'Ethan Hernandez', 'Refillable', '2025-04-01', 'YZ Pharmaceuticals'),
(11, 'Hydrochlorothiazide', '25 mg', 'Take one tablet daily', 'Ava Martinez', 'Refillable', '2025-03-01', '123 Pharmaceuticals'),
(12, 'Prednisone', '10 mg', 'Take one tablet twice daily with food', 'Noah Gonzalez', 'Refillable', '2025-04-01', '456 Pharmaceuticals'),
(13, 'Gabapentin', '300 mg', 'Take one capsule three times daily', 'Isabella Lopez', 'Refillable with doctor approval', '2025-03-01', '789 Pharmaceuticals'),
(14, 'Metoprolol', '50 mg', 'Take one tablet twice daily', 'Mia Clark', 'Refillable', '2025-03-01', '012 Pharmaceuticals'),
(15, 'Amlodipine', '5 mg', 'Take one tablet daily', 'Alexander Hernandez', 'Refillable', '2025-04-01', '345 Pharmaceuticals'),
(16, 'Citalopram', '20 mg', 'Take one tablet daily', 'Lucas Martin', 'Refillable', '2025-03-01', '678 Pharmaceuticals'),
(17, 'Tramadol', '50 mg', 'Take one tablet every 4-6 hours as needed', 'Sophia Adams', 'Refillable with doctor approval', '2025-03-01', '901 Pharmaceuticals'),
(18, 'Trazodone', '50 mg', 'Take one tablet at bedtime as directed', 'Mia Hernandez', 'Refillable', '2025-04-01', '234 Pharmaceuticals'),
(19, 'Sertraline', '50 mg', 'Take one tablet daily', 'Lucas Lopez', 'Refillable', '2025-03-01', '567 Pharmaceuticals'),
(20, 'Escitalopram', '10 mg', 'Take one tablet daily', 'Sophia Martin', 'Refillable', '2025-03-01', '890 Pharmaceuticals'),
(21, 'Aspirin', '81 mg', 'Take one tablet daily', 'John Smith', 'Refillable', '2025-03-01', 'ABC Pharmaceuticals'),
(22, 'Acetaminophen', '500 mg', 'Take two tablets every 6 hours as needed', 'Emily Johnson', 'Refillable with doctor approval', '2025-04-01', 'XYZ Pharmaceuticals'),
(23, 'Hydrocortisone cream', 'Apply thin layer to affected area twice daily', 'For external use only', 'Michael Smith', 'Not refillable', '2025-03-01', 'DEF Pharmaceuticals'),
(24, 'Sumatriptan', '50 mg', 'Take one tablet at onset of migraine symptoms', 'Emily Johnson', 'Refillable with doctor approval', '2025-04-01', 'GHI Pharmaceuticals'),
(25, 'Cetirizine', '10 mg', 'Take one tablet daily', 'Jessica Brown', 'Refillable', '2025-03-01', 'JKL Pharmaceuticals'),
(26, 'Fluticasone', '50 mcg', 'Spray two puffs into each nostril daily', 'Olivia Wilson', 'Refillable', '2025-03-01', 'MNO Pharmaceuticals'),
(27, 'Famotidine', '20 mg', 'Take one tablet twice daily before meals', 'James Martinez', 'Refillable', '2025-04-01', 'PQR Pharmaceuticals'),
(28, 'Ranitidine', '150 mg', 'Take one tablet twice daily', 'Sophia Rodriguez', 'Refillable', '2025-03-01', 'STU Pharmaceuticals'),
(29, 'Methotrexate', '10 mg', 'Take one tablet once a week with food', 'William Garcia', 'Refillable', '2025-03-01', 'VWX Pharmaceuticals'),
(35, 'ACE inhibitors', 'Varies', 'Take as directed by physician', 'James Martinez', 'Refillable', '2025-03-01', 'PQR Pharmaceuticals');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `PositionRole` varchar(100) DEFAULT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `ShiftSchedule` varchar(100) DEFAULT NULL,
  `EmploymentStatus` varchar(50) DEFAULT NULL,
  `SalaryInformation` decimal(10,2) DEFAULT NULL,
  `PerformanceReviews` text DEFAULT NULL,
  `TrainingHistory` text DEFAULT NULL,
  `LeaveRecords` text DEFAULT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `PositionRole`, `ContactInformation`, `DepartmentID`, `ShiftSchedule`, `EmploymentStatus`, `SalaryInformation`, `PerformanceReviews`, `TrainingHistory`, `LeaveRecords`, `userID`) VALUES
(1, 'Sarah Johnson', 'Nurse', '555-111-2222', 1, 'Day Shift', 'Full-time', 55000.00, 'Excellent performance', 'Completed CPR training', 'Annual leave from 2024-03-20 to 2024-03-25', 121),
(2, 'Michael Williams', 'Nurse', '444-222-3333', 2, 'Night Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed first aid training', 'Sick leave on 2024-03-19', 122),
(3, 'Emily Brown', 'Nurse', '333-333-4444', 1, 'Evening Shift', 'Part-time', 40000.00, 'Needs improvement in time management', 'Underwent leadership training', 'Annual leave from 2024-03-22 to 2024-03-27', 123),
(4, 'James Smith', 'Nurse', '222-444-5555', 3, 'Day Shift', 'Full-time', 180000.00, 'Outstanding performance', 'Certified in ACLS', 'Sick leave on 2024-03-18', 124),
(5, 'Jessica Davis', 'Nurse', '111-555-6666', 1, 'Night Shift', 'Full-time', 60000.00, 'Above expectations', 'Completed infection control training', 'Annual leave from 2024-03-25 to 2024-03-30', 125),
(6, 'Daniel Wilson', 'Physician', '999-888-7777', 2, 'Day Shift', 'Full-time', 130000.00, 'Needs improvement in communication skills', 'Underwent conflict resolution training', 'Annual leave from 2024-03-20 to 2024-03-25', 126),
(7, 'Olivia Taylor', 'Nurse', '777-666-5555', 1, 'Night Shift', 'Part-time', 45000.00, 'Excellent performance', 'Certified in BLS', 'Sick leave on 2024-03-21', 127),
(8, 'Andrew Martinez', 'Nurse', '666-555-4444', 2, 'Evening Shift', 'Full-time', 125000.00, 'Satisfactory performance', 'Completed customer service training', 'Annual leave from 2024-03-23 to 2024-03-28', 128),
(9, 'Sophia Hernandez', 'Nurse', '555-444-3333', 1, 'Day Shift', 'Full-time', 58000.00, 'Outstanding performance', 'Certified in ACLS', 'Annual leave from 2024-03-20 to 2024-03-25', 129),
(10, 'William Garcia', 'Nurse', '444-333-2222', 2, 'Night Shift', 'Full-time', 140000.00, 'Above expectations', 'Completed leadership training', 'Sick leave on 2024-03-18', 130),
(11, 'Ethan Rodriguez', 'Nurse', '333-222-1111', 1, 'Evening Shift', 'Part-time', 42000.00, 'Needs improvement in time management', 'Underwent communication skills training', 'Annual leave from 2024-03-22 to 2024-03-27', 131),
(12, 'Ava Martinez', 'Nurse', '222-333-4444', 3, 'Day Shift', 'Full-time', 175000.00, 'Excellent performance', 'Certified in BLS', 'Sick leave on 2024-03-19', 132),
(13, 'Sophia Hernandez', 'Nurse', '111-222-3333', 1, 'Night Shift', 'Full-time', 62000.00, 'Satisfactory performance', 'Completed first aid training', 'Annual leave from 2024-03-20 to 2024-03-25', 133),
(14, 'Benjamin Diaz', 'Nurse', '777-888-9999', 2, 'Evening Shift', 'Full-time', 135000.00, 'Outstanding performance', 'Completed infection control training', 'Sick leave on 2024-03-21', 134),
(15, 'Emma Perez', 'Nurse', '555-666-7777', 1, 'Day Shift', 'Part-time', 48000.00, 'Above expectations', 'Certified in ACLS', 'Annual leave from 2024-03-22 to 2024-03-27', 135),
(16, 'James Lopez', 'Nurse', '444-555-6666', 2, 'Night Shift', 'Full-time', 145000.00, 'Needs improvement in communication skills', 'Underwent conflict resolution training', 'Sick leave on 2024-03-18', 136),
(17, 'Mia Sonzalez', 'Nurse', '333-444-5555', 1, 'Evening Shift', 'Full-time', 54000.00, 'Excellent performance', 'Certified in BLS', 'Annual leave from 2024-03-23 to 2024-03-28', 137),
(18, 'Lucas Martin', 'Nurse', '222-333-4444', 2, 'Day Shift', 'Full-time', 150000.00, 'Satisfactory performance', 'Completed customer service training', 'Sick leave on 2024-03-19', 138),
(19, 'Isabella Adams', 'Nurse', '111-222-3333', 1, 'Night Shift', 'Part-time', 47000.00, 'Outstanding performance', 'Certified in ACLS', 'Annual leave from 2024-03-20 to 2024-03-25', 139),
(20, 'Alexander Clark', 'Physician', '999-888-7777', 2, 'Evening Shift', 'Full-time', 130000.00, 'Above expectations', 'Completed leadership training', 'Sick leave on 2024-03-21', 140),
(21, 'Dr. John Smith', 'Doctor', '555-111-2222', 1, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 141),
(22, 'Dr. Emily Brown', 'Doctor', '444-222-3333', 2, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 142),
(23, 'Dr. Michael Williams', 'Doctor', '333-333-4444', 3, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 143),
(24, 'Dr. Jessica Davis', 'Doctor', '222-444-5555', 4, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 144),
(25, 'Dr. James Smith', 'Doctor', '111-555-6666', 5, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 145),
(26, 'Dr. Olivia Taylor', 'Doctor', '999-888-7777', 6, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 146),
(27, 'Dr. Andrew Martinez', 'Doctor', '777-666-5555', 7, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 147),
(28, 'Dr. Sophia Hernandez', 'Doctor', '666-555-4444', 8, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 148),
(29, 'Dr. William Garcia', 'Doctor', '555-444-3333', 9, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 149),
(30, 'Dr. Ethan Rodriguez', 'Doctor', '444-333-2222', 10, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 150),
(31, 'Dr. Ava Martinez', 'Doctor', '333-222-1111', 11, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 151),
(32, 'Dr. Benjamin Diaz', 'Doctor', '222-333-4444', 12, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 152),
(33, 'Dr. Emma Perez', 'Doctor', '111-222-3333', 13, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 153),
(34, 'Dr. James Lopez', 'Doctor', '777-888-9999', 14, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 154),
(35, 'Dr. Mia Gonzalez', 'Doctor', '555-666-7777', 15, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 155),
(36, 'Dr. Lucas Martin', 'Doctor', '444-555-6666', 16, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 156),
(37, 'Dr. Isabella Adams', 'Doctor', '333-444-5555', 17, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 157),
(38, 'Dr. Alexander Clark', 'Doctor', '222-333-4444', 18, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 158),
(39, 'Dr. Sofia Ramirez', 'Doctor', '111-222-3333', 19, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 159),
(40, 'Dr. William Thompson', 'Doctor', '999-888-7777', 20, 'Day Shift', 'Full-time', 120000.00, 'Satisfactory performance', 'Completed CPR training', 'No leave records', 160),
(41, 'Sarah Johnson', 'Lab Technician', '111-222-3333', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 161),
(42, 'Emily Brown', 'Lab Technician', '222-333-4444', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 162),
(43, 'Michael Williams', 'Lab Technician', '333-444-5555', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 163),
(44, 'Jessica Davis', 'Lab Technician', '444-555-6666', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 164),
(45, 'James Smith', 'Lab Technician', '555-666-7777', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 165),
(46, 'Olivia Taylor', 'Lab Technician', '666-777-8888', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 166),
(47, 'Andrew Martinez', 'Lab Technician', '777-888-9999', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 167),
(48, 'Sophia Hernandez', 'Lab Technician', '888-999-0000', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 168),
(49, 'William Garcia', 'Lab Technician', '999-000-1111', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 169),
(50, 'Ethan Rodriguez', 'Lab Technician', '000-111-2222', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 170),
(51, 'Ava Martinez', 'Lab Technician', '111-222-3333', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 171),
(52, 'James Lopez', 'Lab Technician', '222-333-4444', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 172),
(53, 'Mia Gonzalez', 'Nurse', '333-444-5555', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 173),
(54, 'Isabella Adams', 'Lab Technician', '444-555-6666', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 174),
(55, 'Alexander Clark', 'Lab Technician', '555-666-7777', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 175),
(56, 'Lucas Martin', 'Lab Technician', '666-777-8888', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 176),
(57, 'Sophia Ramirez', 'Lab Technician', '777-888-9999', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 177),
(58, 'William Thompson', 'Lab Technician', '888-999-0000', 20, 'Day Shift', 'Full-time', 80000.00, 'Satisfactory performance', 'Completed lab technician training', 'No leave records', 178),
(59, 'David Johnson', 'Manager', '999-999-9999', NULL, NULL, 'Full-time', 100000.00, 'Excellent performance', 'Completed management training', NULL, 179),
(60, 'Rachel Smith', 'Manager', '888-888-8888', NULL, NULL, 'Full-time', 95000.00, 'Above expectations', 'Completed leadership seminar', NULL, 180),
(61, 'Emily Wilson', 'Patient Registrar', '777-777-7777', NULL, NULL, 'Full-time', 60000.00, 'Satisfactory performance', 'Completed patient management training', NULL, 181),
(62, 'Michael Thompson', 'Accountant', '666-666-6666', NULL, NULL, 'Full-time', 80000.00, 'Outstanding performance', 'Certified in accounting', NULL, 182),
(63, 'Jessica Miller', 'IT Support Specialist', '555-555-5555', NULL, NULL, 'Full-time', 70000.00, 'Satisfactory performance', 'Completed IT troubleshooting course', NULL, 183);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surgeries`
--

CREATE TABLE `surgeries` (
  `SurgeryID` int(11) NOT NULL,
  `SurgeonID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `surgeries`
--

INSERT INTO `surgeries` (`SurgeryID`, `SurgeonID`) VALUES
(1, 23),
(2, 24),
(3, 25),
(4, 26),
(5, 27),
(6, 28),
(7, 29),
(8, 30),
(9, 31),
(10, 32),
(11, 33),
(12, 34),
(13, 35),
(14, 36),
(15, 37),
(16, 38),
(17, 39),
(18, 40),
(19, 21),
(20, 22);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surgeryinfo`
--

CREATE TABLE `surgeryinfo` (
  `SurgeryID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `SurgeryDateTime` datetime DEFAULT NULL,
  `SurgeryTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `surgeryinfo`
--

INSERT INTO `surgeryinfo` (`SurgeryID`, `PatientID`, `SurgeryDateTime`, `SurgeryTypeID`) VALUES
(1, 1, '2024-03-18 10:00:00', 1),
(2, 2, '2024-03-18 11:00:00', 2),
(3, 3, '2024-03-18 12:00:00', 3),
(4, 4, '2024-03-18 13:00:00', 4),
(5, 5, '2024-03-18 14:00:00', 5),
(6, 6, '2024-03-18 15:00:00', 6),
(7, 7, '2024-03-18 16:00:00', 7),
(8, 8, '2024-03-18 17:00:00', 8),
(9, 9, '2024-03-18 18:00:00', 9),
(10, 10, '2024-03-18 19:00:00', 10),
(11, 11, '2024-03-18 20:00:00', 11),
(12, 12, '2024-03-18 21:00:00', 12),
(13, 13, '2024-03-18 22:00:00', 13),
(14, 14, '2024-03-18 23:00:00', 14),
(15, 15, '2024-03-19 10:00:00', 15),
(16, 16, '2024-03-19 11:00:00', 16),
(17, 17, '2024-03-19 12:00:00', 17),
(18, 18, '2024-03-19 13:00:00', 18),
(19, 19, '2024-03-19 14:00:00', 19),
(20, 20, '2024-03-19 15:00:00', 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surgerytype`
--

CREATE TABLE `surgerytype` (
  `SurgeryID` int(11) NOT NULL,
  `SurgeryProcedure` text DEFAULT NULL,
  `AnesthesiaType` text DEFAULT NULL,
  `SurgicalTeam` text DEFAULT NULL,
  `PreoperativeInstructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `surgerytype`
--

INSERT INTO `surgerytype` (`SurgeryID`, `SurgeryProcedure`, `AnesthesiaType`, `SurgicalTeam`, `PreoperativeInstructions`) VALUES
(1, 'Coronary artery bypass grafting', 'General anesthesia', 'Cardiac surgery team', 'NPO after midnight'),
(2, 'Appendectomy', 'General anesthesia', 'General surgery team', 'NPO after midnight'),
(3, 'Laparoscopic cholecystectomy', 'General anesthesia', 'General surgery team', 'NPO after midnight'),
(4, 'Skin grafting', 'Local anesthesia', 'Plastic surgery team', 'N/A'),
(5, 'Craniotomy', 'General anesthesia', 'Neurosurgery team', 'NPO after midnight'),
(6, 'Tonsillectomy', 'General anesthesia', 'ENT surgery team', 'NPO after midnight'),
(7, 'Colon resection', 'General anesthesia', 'Colorectal surgery team', 'NPO after midnight'),
(8, 'Cataract surgery', 'Local anesthesia', 'Ophthalmology surgery team', 'N/A'),
(9, 'Thyroidectomy', 'General anesthesia', 'Endocrine surgery team', 'NPO after midnight'),
(10, 'Knee arthroscopy', 'Regional anesthesia', 'Orthopedic surgery team', 'NPO after midnight'),
(11, 'Angioplasty', 'Local anesthesia', 'Interventional cardiology team', 'N/A'),
(12, 'Facelift', 'General anesthesia', 'Plastic surgery team', 'NPO after midnight'),
(13, 'Kidney transplant', 'General anesthesia', 'Transplant surgery team', 'NPO after midnight'),
(14, 'Rhinoplasty', 'General anesthesia', 'Plastic surgery team', 'NPO after midnight'),
(15, 'Dialysis fistula creation', 'Local anesthesia', 'Vascular surgery team', 'N/A'),
(16, 'Septoplasty', 'Local anesthesia', 'ENT surgery team', 'NPO after midnight'),
(17, 'Hemodialysis catheter placement', 'Local anesthesia', 'Interventional nephrology team', 'N/A'),
(18, 'Lumpectomy', 'General anesthesia', 'Breast surgery team', 'NPO after midnight'),
(19, 'Laminectomy', 'General anesthesia', 'Neurosurgery team', 'NPO after midnight'),
(20, 'Mastectomy', 'General anesthesia', 'Breast surgery team', 'NPO after midnight');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testtypes`
--

CREATE TABLE `testtypes` (
  `TestID` int(11) NOT NULL,
  `TestType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `testtypes`
--

INSERT INTO `testtypes` (`TestID`, `TestType`) VALUES
(1, 'Blood test'),
(2, 'Urinalysis'),
(3, 'X-ray'),
(4, 'MRI'),
(5, 'EEG'),
(6, 'Ultrasound'),
(7, 'EKG'),
(8, 'Colonoscopy'),
(9, 'CT scan'),
(10, 'PET scan'),
(11, 'CBC'),
(12, 'Lipid profile'),
(13, 'Fasting glucose'),
(14, 'HbA1c'),
(15, 'Skin biopsy'),
(16, 'Allergy testing'),
(17, 'Pulmonary function tests'),
(18, 'Upper endoscopy'),
(19, 'H. pylori testing'),
(20, 'ECG'),
(21, 'Stress test'),
(22, 'Audiometry'),
(23, 'Thyroid function tests'),
(24, 'Renal function tests'),
(25, 'Anti-CCP'),
(26, 'Rheumatoid factor'),
(27, 'Biopsy'),
(28, 'Mammogram');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `userTypeID` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`UserID`, `userTypeID`, `username`, `password`) VALUES
(1, 9, 'johndoe@example.com', 'johndoe'),
(2, 9, 'janesmith@example.com', 'janesmith'),
(3, 9, 'emilyjohnson@example.com', 'emilyjohnson'),
(4, 9, 'michaelbrown@example.com', 'michaelbrown'),
(5, 9, 'jessicalee@example.com', 'jessicalee'),
(6, 9, 'danielwilson@example.com', 'danielwilson'),
(7, 9, 'oliviataylor@example.com', 'oliviataylor'),
(8, 9, 'andrewmartinez@example.com', 'andrewmartinez'),
(9, 9, 'sophiahernandez@example.com', 'sophiahernandez'),
(10, 9, 'williamgarcia@example.com', 'williamgarcia'),
(11, 9, 'ethanrodriguez@example.com', 'ethanrodriguez'),
(12, 9, 'avamartinez@example.com', 'avamartinez'),
(13, 9, 'sophiahernandez2@example.com', 'sophiahernandez2'),
(14, 9, 'benjamindiaz@example.com', 'benjamindiaz'),
(15, 9, 'emmaperez@example.com', 'emmaperez'),
(16, 9, 'jameslopez@example.com', 'jameslopez'),
(17, 9, 'miagonzalez@example.com', 'miagonzalez'),
(18, 9, 'lucasmartin@example.com', 'lucasmartin'),
(19, 9, 'isabellaadams@example.com', 'isabellaadams'),
(20, 9, 'alexanderclark@example.com', 'alexanderclark'),
(42, 9, 'betuldemirci@example.com', 'betuldemirci'),
(43, 9, 'hilalozkan@example.com', 'hilalozkan'),
(44, 9, 'hicranozdemir@example.com', 'hicranozdemir'),
(45, 9, 'ahmetaslan@example.com', 'ahmetaslan'),
(118, 9, 'akintatar@example.com', 'akintatar'),
(121, 1, 'sarah.johnson@example.com', 'password1'),
(122, 1, 'michael.williams@example.com', 'password2'),
(123, 1, 'emily.brown@example.com', 'password3'),
(124, 1, 'james.smith@example.com', 'password4'),
(125, 1, 'jessica.davis@example.com', 'password5'),
(126, 2, 'daniel.wilson@example.com', 'password6'),
(127, 1, 'olivia.taylor@example.com', 'password7'),
(128, 1, 'andrew.martinez@example.com', 'password8'),
(129, 1, 'sophia.hernandez@example.com', 'password9'),
(130, 1, 'william.garcia@example.com', 'password10'),
(131, 1, 'ethan.rodriguez@example.com', 'password11'),
(132, 1, 'ava.martinez@example.com', 'password12'),
(133, 1, 'sophia.hernandez2@example.com', 'password13'),
(134, 1, 'benjamin.diaz@example.com', 'password14'),
(135, 1, 'emma.perez@example.com', 'password15'),
(136, 1, 'james.lopez@example.com', 'password16'),
(137, 1, 'mia.sonzalez@example.com', 'password17'),
(138, 1, 'lucas.martin@example.com', 'password18'),
(139, 1, 'isabella.adams@example.com', 'password19'),
(140, 2, 'alexander.clark@example.com', 'password20'),
(141, 4, 'john.smith@example.com', 'password21'),
(142, 4, 'emily.brown2@example.com', 'password22'),
(143, 4, 'michael.williams2@example.com', 'password23'),
(144, 4, 'jessica.davis2@example.com', 'password24'),
(145, 4, 'james.smith2@example.com', 'password25'),
(146, 4, 'olivia.taylor2@example.com', 'password26'),
(147, 4, 'andrew.martinez2@example.com', 'password27'),
(148, 4, 'sophia.hernandez3@example.com', 'password28'),
(149, 4, 'william.garcia2@example.com', 'password29'),
(150, 4, 'ethan.rodriguez2@example.com', 'password30'),
(151, 4, 'ava.martinez2@example.com', 'password31'),
(152, 4, 'benjamin.diaz2@example.com', 'password32'),
(153, 4, 'emma.perez2@example.com', 'password33'),
(154, 4, 'james.lopez2@example.com', 'password34'),
(155, 4, 'mia.gonzalez2@example.com', 'password35'),
(156, 4, 'lucas.martin2@example.com', 'password36'),
(157, 4, 'isabella.adams2@example.com', 'password37'),
(158, 4, 'alexander.clark2@example.com', 'password38'),
(159, 4, 'sofia.ramirez@example.com', 'password39'),
(160, 4, 'william.thompson@example.com', 'password40'),
(161, 3, 'sarah.johnson2@example.com', 'password41'),
(162, 3, 'emily.brown3@example.com', 'password42'),
(163, 3, 'michael.williams3@example.com', 'password43'),
(164, 3, 'jessica.davis3@example.com', 'password44'),
(165, 3, 'james.smith3@example.com', 'password45'),
(166, 3, 'olivia.taylor3@example.com', 'password46'),
(167, 3, 'andrew.martinez3@example.com', 'password47'),
(168, 3, 'sophia.hernandez4@example.com', 'password48'),
(169, 3, 'william.garcia3@example.com', 'password49'),
(170, 3, 'ethan.rodriguez3@example.com', 'password50'),
(171, 3, 'ava.martinez3@example.com', 'password51'),
(172, 3, 'james.lopez3@example.com', 'password52'),
(173, 3, 'mia.gonzalez3@example.com', 'password53'),
(174, 3, 'isabella.adams3@example.com', 'password54'),
(175, 3, 'alexander.clark3@example.com', 'password55'),
(176, 3, 'lucas.martin3@example.com', 'password56'),
(177, 3, 'sophia.ramirez2@example.com', 'password57'),
(178, 3, 'william.thompson2@example.com', 'password58'),
(179, 5, 'david.johnson@example.com', 'password59'),
(180, 5, 'rachel.smith@example.com', 'password60'),
(181, 6, 'emily.wilson@example.com', 'password61'),
(182, 7, 'michael.thompson@example.com', 'password62'),
(183, 8, 'jessica.miller@example.com', 'password63');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `usertype`
--

CREATE TABLE `usertype` (
  `userTypeID` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `usertype`
--

INSERT INTO `usertype` (`userTypeID`, `role`) VALUES
(1, 'Nurse'),
(2, 'Physician'),
(3, 'Lab Technician'),
(4, 'Doctor'),
(5, 'Manager'),
(6, 'Patient Registrar'),
(7, 'Accountant'),
(8, 'IT Support Specialist'),
(9, 'Patient');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wards`
--

CREATE TABLE `wards` (
  `WardID` int(11) NOT NULL,
  `WardName` varchar(100) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `CurrentOccupancy` int(11) DEFAULT NULL,
  `NurseInCharge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `wards`
--

INSERT INTO `wards` (`WardID`, `WardName`, `Capacity`, `CurrentOccupancy`, `NurseInCharge`) VALUES
(1, 'General Ward', 30, 20, 1),
(2, 'Pediatric Ward', 20, 15, 3),
(3, 'Surgical Ward', 25, 18, 2),
(4, 'Maternity Ward', 15, 10, 9),
(5, 'Intensive Care Unit', 10, 8, 5),
(6, 'Psychiatric Ward', 20, 12, 7),
(7, 'Oncology Ward', 15, 10, 10),
(8, 'Cardiology Ward', 20, 15, 15),
(9, 'Orthopedic Ward', 20, 14, 4),
(10, 'Neurology Ward', 15, 12, 8),
(11, 'Emergency Ward', 25, 20, 9),
(12, 'ENT Ward', 10, 8, 14),
(13, 'Gynecology Ward', 15, 11, 12),
(14, 'Geriatric Ward', 20, 18, 18),
(15, 'Rehabilitation Ward', 15, 12, 53),
(16, 'Burn Unit', 10, 7, 16),
(17, 'Hematology Ward', 15, 10, 19),
(18, 'Radiology Ward', 20, 16, 10),
(19, 'Urology Ward', 15, 11, 11),
(20, 'Dialysis Unit', 10, 8, 53);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `administrativetasks`
--
ALTER TABLE `administrativetasks`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `AssignedStaff` (`AssignedStaff`);

--
-- Tablo için indeksler `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`AdmissionID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `WardAssigned` (`WardAssigned`),
  ADD KEY `admissions_ibfk_3` (`AdmittingDoctor`);

--
-- Tablo için indeksler `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `fk_initial_appointment` (`initialAppointmentID`);

--
-- Tablo için indeksler `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`BillID`,`ServiceID`),
  ADD KEY `fk_ServiceID` (`ServiceID`);

--
-- Tablo için indeksler `billinginfo`
--
ALTER TABLE `billinginfo`
  ADD PRIMARY KEY (`BillID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Tablo için indeksler `bloodtype`
--
ALTER TABLE `bloodtype`
  ADD PRIMARY KEY (`bloodtypeID`);

--
-- Tablo için indeksler `caretype`
--
ALTER TABLE `caretype`
  ADD PRIMARY KEY (`CareTypeID`),
  ADD UNIQUE KEY `CarePlan` (`CarePlan`);

--
-- Tablo için indeksler `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD KEY `fk_DepartmentHeadID` (`DepartmentHeadID`);

--
-- Tablo için indeksler `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosisID`,`MedicationID`),
  ADD KEY `FK_Diagnosis_Pharmacy` (`MedicationID`);

--
-- Tablo için indeksler `diagnosisinfo`
--
ALTER TABLE `diagnosisinfo`
  ADD PRIMARY KEY (`diagnosisID`);

--
-- Tablo için indeksler `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Tablo için indeksler `facilitymanagement`
--
ALTER TABLE `facilitymanagement`
  ADD PRIMARY KEY (`FacilityID`);

--
-- Tablo için indeksler `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`InsuranceID`);

--
-- Tablo için indeksler `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ItemID`);

--
-- Tablo için indeksler `itemsservices`
--
ALTER TABLE `itemsservices`
  ADD PRIMARY KEY (`ServiceID`);

--
-- Tablo için indeksler `labtechnician`
--
ALTER TABLE `labtechnician`
  ADD PRIMARY KEY (`LabTechnicianID`);

--
-- Tablo için indeksler `labtests`
--
ALTER TABLE `labtests`
  ADD PRIMARY KEY (`TestID`),
  ADD UNIQUE KEY `unique_labtest_entry` (`PatientID`,`TestTypeID`,`DateTime`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `FK_TestType_TestID` (`TestTypeID`),
  ADD KEY `fk_labtechnician_tests` (`LabTechnicianID`);

--
-- Tablo için indeksler `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD PRIMARY KEY (`RecordID`),
  ADD UNIQUE KEY `medicalrecords_id_uk` (`PatientID`,`DoctorID`,`DateOfVisit`,`LabTestOrderID`,`DiagnosisID`),
  ADD KEY `DoctorID` (`DoctorID`),
  ADD KEY `FK_LabTests_TestID` (`LabTestOrderID`),
  ADD KEY `fk_diagnosis_diagnosisinfo_id` (`DiagnosisID`);

--
-- Tablo için indeksler `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`NurseID`);

--
-- Tablo için indeksler `patientcare`
--
ALTER TABLE `patientcare`
  ADD PRIMARY KEY (`admissionID`,`CareTypeID`),
  ADD KEY `fk_caretype` (`CareTypeID`),
  ADD KEY `fk_nurse` (`CareProviderID`);

--
-- Tablo için indeksler `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientId`),
  ADD KEY `fk_insurance` (`InsuranceId`),
  ADD KEY `fk_patient_bloodtype` (`bloodtypeID`);

--
-- Tablo için indeksler `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`MedicationID`);

--
-- Tablo için indeksler `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `fk_user` (`userID`),
  ADD KEY `FK_Staff_Department` (`DepartmentID`);

--
-- Tablo için indeksler `surgeries`
--
ALTER TABLE `surgeries`
  ADD PRIMARY KEY (`SurgeryID`,`SurgeonID`),
  ADD KEY `SurgeonID` (`SurgeonID`);

--
-- Tablo için indeksler `surgeryinfo`
--
ALTER TABLE `surgeryinfo`
  ADD PRIMARY KEY (`SurgeryID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `SurgeryTypeID` (`SurgeryTypeID`);

--
-- Tablo için indeksler `surgerytype`
--
ALTER TABLE `surgerytype`
  ADD PRIMARY KEY (`SurgeryID`);

--
-- Tablo için indeksler `testtypes`
--
ALTER TABLE `testtypes`
  ADD PRIMARY KEY (`TestID`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `userTypeID` (`userTypeID`);

--
-- Tablo için indeksler `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`userTypeID`);

--
-- Tablo için indeksler `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`WardID`),
  ADD KEY `fk_nurses_wards` (`NurseInCharge`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `caretype`
--
ALTER TABLE `caretype`
  MODIFY `CareTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Tablo için AUTO_INCREMENT değeri `itemsservices`
--
ALTER TABLE `itemsservices`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `medicalrecords`
--
ALTER TABLE `medicalrecords`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `surgeryinfo`
--
ALTER TABLE `surgeryinfo`
  MODIFY `SurgeryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `surgerytype`
--
ALTER TABLE `surgerytype`
  MODIFY `SurgeryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `testtypes`
--
ALTER TABLE `testtypes`
  MODIFY `TestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `administrativetasks`
--
ALTER TABLE `administrativetasks`
  ADD CONSTRAINT `administrativetasks_ibfk_1` FOREIGN KEY (`AssignedStaff`) REFERENCES `staff` (`StaffID`);

--
-- Tablo kısıtlamaları `admissions`
--
ALTER TABLE `admissions`
  ADD CONSTRAINT `admissions_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `admissions_ibfk_2` FOREIGN KEY (`WardAssigned`) REFERENCES `wards` (`WardID`),
  ADD CONSTRAINT `admissions_ibfk_3` FOREIGN KEY (`AdmittingDoctor`) REFERENCES `doctors` (`DoctorID`);

--
-- Tablo kısıtlamaları `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  ADD CONSTRAINT `fk_initial_appointment` FOREIGN KEY (`initialAppointmentID`) REFERENCES `appointments` (`AppointmentID`);

--
-- Tablo kısıtlamaları `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `fk_BillID` FOREIGN KEY (`BillID`) REFERENCES `billinginfo` (`BillID`),
  ADD CONSTRAINT `fk_ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `itemsservices` (`ServiceID`);

--
-- Tablo kısıtlamaları `billinginfo`
--
ALTER TABLE `billinginfo`
  ADD CONSTRAINT `billinginfo_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`);

--
-- Tablo kısıtlamaları `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_DepartmentHeadID` FOREIGN KEY (`DepartmentHeadID`) REFERENCES `doctors` (`DoctorID`);

--
-- Tablo kısıtlamaları `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `FK_Diagnosis_Pharmacy` FOREIGN KEY (`MedicationID`) REFERENCES `pharmacy` (`MedicationID`),
  ADD CONSTRAINT `fk_diagnosisid2` FOREIGN KEY (`diagnosisID`) REFERENCES `diagnosisinfo` (`diagnosisID`);

--
-- Tablo kısıtlamaları `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `fk_doctor_staff` FOREIGN KEY (`DoctorID`) REFERENCES `staff` (`StaffID`);

--
-- Tablo kısıtlamaları `labtechnician`
--
ALTER TABLE `labtechnician`
  ADD CONSTRAINT `labtechnician_ibfk_1` FOREIGN KEY (`LabTechnicianID`) REFERENCES `staff` (`StaffID`);

--
-- Tablo kısıtlamaları `labtests`
--
ALTER TABLE `labtests`
  ADD CONSTRAINT `FK_TestType_TestID` FOREIGN KEY (`TestTypeID`) REFERENCES `testtypes` (`TestID`),
  ADD CONSTRAINT `fk_labtechnician` FOREIGN KEY (`LabTechnicianID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `fk_labtechnician_tests` FOREIGN KEY (`LabTechnicianID`) REFERENCES `labtechnician` (`LabTechnicianID`),
  ADD CONSTRAINT `labtests_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `labtests_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`);

--
-- Tablo kısıtlamaları `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD CONSTRAINT `FK_LabTests_TestID` FOREIGN KEY (`LabTestOrderID`) REFERENCES `labtests` (`TestID`),
  ADD CONSTRAINT `fk_diagnosis_diagnosisinfo_id` FOREIGN KEY (`DiagnosisID`) REFERENCES `diagnosisinfo` (`diagnosisID`),
  ADD CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `medicalrecords_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`);

--
-- Tablo kısıtlamaları `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`NurseID`) REFERENCES `staff` (`StaffID`);

--
-- Tablo kısıtlamaları `patientcare`
--
ALTER TABLE `patientcare`
  ADD CONSTRAINT `fk_admission` FOREIGN KEY (`AdmissionID`) REFERENCES `admissions` (`AdmissionID`),
  ADD CONSTRAINT `fk_admission2` FOREIGN KEY (`admissionID`) REFERENCES `admissions` (`AdmissionID`),
  ADD CONSTRAINT `fk_admissionn_care` FOREIGN KEY (`AdmissionID`) REFERENCES `admissions` (`AdmissionID`),
  ADD CONSTRAINT `fk_admissionnn` FOREIGN KEY (`AdmissionID`) REFERENCES `admissions` (`AdmissionID`),
  ADD CONSTRAINT `fk_caretype` FOREIGN KEY (`CareTypeID`) REFERENCES `caretype` (`CareTypeID`),
  ADD CONSTRAINT `fk_nurse` FOREIGN KEY (`CareProviderID`) REFERENCES `nurse` (`NurseID`),
  ADD CONSTRAINT `fk_patientcare_admission` FOREIGN KEY (`admissionsID`) REFERENCES `admission` (`admissionID`),
  ADD CONSTRAINT `fk_patientcare_admissions` FOREIGN KEY (`admissionsID`) REFERENCES `admissions` (`AdmissionID`);

--
-- Tablo kısıtlamaları `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_insurance` FOREIGN KEY (`InsuranceId`) REFERENCES `insurance` (`InsuranceID`),
  ADD CONSTRAINT `fk_patient2_user` FOREIGN KEY (`patientID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `fk_patientT_user` FOREIGN KEY (`patientId`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `fk_patient_bloodtype` FOREIGN KEY (`bloodtypeID`) REFERENCES `bloodtype` (`bloodtypeID`),
  ADD CONSTRAINT `fk_patients_user` FOREIGN KEY (`patientID`) REFERENCES `users` (`UserID`);

--
-- Tablo kısıtlamaları `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FK_Staff_Department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Tablo kısıtlamaları `surgeries`
--
ALTER TABLE `surgeries`
  ADD CONSTRAINT `fk_surgeryinfo_surgeryID` FOREIGN KEY (`SurgeryID`) REFERENCES `surgeryinfo` (`SurgeryID`),
  ADD CONSTRAINT `surgeries_ibfk_2` FOREIGN KEY (`SurgeonID`) REFERENCES `doctors` (`DoctorID`);

--
-- Tablo kısıtlamaları `surgeryinfo`
--
ALTER TABLE `surgeryinfo`
  ADD CONSTRAINT `surgeryinfo_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `surgeryinfo_ibfk_2` FOREIGN KEY (`SurgeryTypeID`) REFERENCES `surgerytype` (`SurgeryID`);

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userTypeID`) REFERENCES `usertype` (`userTypeID`);

--
-- Tablo kısıtlamaları `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `fk_nurse_wards` FOREIGN KEY (`NurseInCharge`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `fk_nurses_wards` FOREIGN KEY (`NurseInCharge`) REFERENCES `nurse` (`NurseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
