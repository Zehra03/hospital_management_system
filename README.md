<p align="center">
  <img src="https://img.shields.io/badge/Database-MariaDB%20%7C%20MySQL-003545?style=for-the-badge&logo=mysql&logoColor=white" alt="Database" />
  <img src="https://img.shields.io/badge/Backend-PHP%208.2-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP" />
  <img src="https://img.shields.io/badge/Project-Hospital%20Management-2EC4B6?style=for-the-badge" alt="Project" />
</p>

---

# 🏥 Hospital Management System

A **database-driven hospital management system** built for a Database course assignment. It models a full healthcare facility with patients, staff, appointments, admissions, billing, medical records, lab tests, surgeries, and facility management—all backed by a normalized relational schema and a PHP patient registration API.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Database Schema](#-database-schema)
- [Key Features](#-key-features)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Patient Registration Flow](#-patient-registration-flow)
- [Getting Started](#-getting-started)
- [User Roles](#-user-roles)

---

## 🎯 Overview

This project provides:

| Component | Description |
|-----------|-------------|
| **Database** | `HOSPITAL.sql` — MariaDB/MySQL schema with 30+ tables, foreign keys, and stored functions for appointment chains |
| **Backend** | `patient_registration.php` — REST-style endpoint that creates a user account and patient record from form POST data |

The system supports **patient registration** (user + patient record with hashed password), and the database is designed to support appointments, admissions, billing, lab tests, surgeries, pharmacy, and administrative tasks.

---

## 🏗 Architecture

```mermaid
flowchart TB
    subgraph Client
        Form[Web Form / Client]
    end

    subgraph Backend["Backend (PHP)"]
        PR[patient_registration.php]
        DBConnect[db_connect.php]
        PR --> DBConnect
    end

    subgraph Database["Database (MariaDB/MySQL)"]
        Users[(users)]
        Patients[(patients)]
        Staff[(staff)]
        Appointments[(appointments)]
        Admissions[(admissions)]
        Billing[(billing / billinginfo)]
        Medical[(medicalrecords)]
        Lab[(labtests)]
        Pharmacy[(pharmacy)]
    end

    Form -->|POST| PR
    PR --> Users
    PR --> Patients
    Users -.->|userID| Patients
    Patients --> Appointments
    Patients --> Admissions
    Patients --> Billing
    Admissions --> Medical
    Medical --> Lab
    Medical --> Pharmacy
```

---

## 🗄 Database Schema

High-level entity relationship view:

```mermaid
erDiagram
    users ||--o| patients : "has"
    users ||--o| staff : "has"
    usertype ||--o{ users : "classifies"

    patients ||--o{ appointments : "books"
    doctors ||--o{ appointments : "handles"
    patients ||--o{ admissions : "admitted"
    wards ||--o{ admissions : "assigns"
    doctors ||--o{ admissions : "admits"

    patients ||--o{ billinginfo : "billed"
    billinginfo ||--o{ billing : "includes"
    itemsservices ||--o{ billing : "services"

    patients ||--o{ medicalrecords : "has"
    doctors ||--o{ medicalrecords : "records"
    diagnosisinfo ||--o{ medicalrecords : "diagnosis"
    labtests ||--o{ medicalrecords : "lab order"

    patients ||--o{ labtests : "tests"
    doctors ||--o{ labtests : "orders"
    labtechnician ||--o{ labtests : "performs"
    testtypes ||--o{ labtests : "type"

    patients ||--o{ surgeryinfo : "undergoes"
    doctors ||--o{ surgeries : "surgeon"
    surgerytype ||--o{ surgeryinfo : "type"

    patients }o--|| insurance : "has"
    patients }o--o| bloodtype : "has"
    staff }o--o| departments : "belongs"
    doctors }o--o| departments : "head"
```

### Core tables (summary)

| Domain | Tables |
|--------|--------|
| **Identity & access** | `users`, `usertype` |
| **People** | `patients`, `staff`, `doctors`, `nurse`, `labtechnician` |
| **Organization** | `departments`, `wards` |
| **Clinical** | `appointments`, `admissions`, `medicalrecords`, `diagnosisinfo`, `diagnosis`, `patientcare`, `caretype` |
| **Lab & pharmacy** | `labtests`, `testtypes`, `pharmacy`, `inventory` |
| **Surgery** | `surgeryinfo`, `surgerytype`, `surgeries` |
| **Billing** | `billinginfo`, `billing`, `itemsservices` |
| **Reference** | `insurance`, `bloodtype`, `facilitymanagement`, `administrativetasks` |

---

## ✨ Key Features

- **Patient registration** — Create user (type Patient) and linked patient record; random password generation and bcrypt hashing
- **Role-based users** — Patients, nurses, physicians, doctors, lab technicians, managers, registrars, accountants, IT support
- **Appointments** — With optional follow-up chain (`initialAppointmentID`); DB functions to traverse previous appointments
- **Admissions & wards** — Ward assignment, admitting doctor, admission/discharge dates
- **Billing** — Bills linked to patients and itemized services (consultation, lab, medication, etc.)
- **Medical records** — Visit date, treatment plan, diagnosis, linked lab orders
- **Lab tests** — Test types, results, status, ordering doctor, performing lab technician
- **Surgeries** — Surgery info, type, surgeon, patient
- **Pharmacy & inventory** — Medications, dosage, prescriptions; inventory with expiry and stock levels
- **Administrative** — Staff tasks, facility management (maintenance, security, cleaning)

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|------------|
| Database | MariaDB 10.4+ / MySQL 8.x |
| Server | PHP 8.2+ (with MySQLi) |
| Export | phpMyAdmin 5.2 (SQL dump) |

*Note: The PHP script expects a `db_connect.php` that returns a MySQLi connection (not included in repo).*

---

## 📁 Project Structure

```
Assignment02/
├── README.md                 # This file
├── HOSPITAL.sql              # Full database schema + sample data
└── patient_registration.php  # Patient registration API (requires db_connect.php)
```

---

## 🔄 Patient Registration Flow

```mermaid
sequenceDiagram
    participant Client
    participant PHP as patient_registration.php
    participant DB as Database

    Client->>PHP: POST (name, dateOfBirth, contactInfo, address, insurance, medicalHistory, allergies, bloodType, emergencyContact, username)
    PHP->>PHP: Validate required fields (name, dateOfBirth)
    PHP->>PHP: generateRandomPassword()
    PHP->>PHP: hashPassword() [bcrypt]
    PHP->>DB: INSERT INTO users (userTypeID=9, username, password)
    DB-->>PHP: user ID (insert_id)
    PHP->>DB: INSERT INTO patients (patientID=user_id, name, DateOfBirth, ...)
    alt Success
        DB-->>PHP: OK
        PHP-->>Client: registration_date (timestamp)
    else Error
        PHP-->>Client: Error message
    end
```

**Required POST fields:** `name`, `dateOfBirth`. Optional: `contactInfo`, `address`, `insurance`, `medicalHistory`, `allergies`, `bloodType`, `emergencyContact`, `username`.

---

## 🚀 Getting Started

### 1. Database setup

1. Create a database (e.g. `hospital`).
2. Import the schema and data:
   ```bash
   mysql -u your_user -p hospital < HOSPITAL.sql
   ```
   Or use phpMyAdmin: create database `hospital`, then **Import** → choose `HOSPITAL.sql`.

### 2. PHP backend

1. Add `db_connect.php` in the same directory as `patient_registration.php`, returning a MySQLi connection to the `hospital` database.
2. Ensure PHP has the MySQLi extension and uses a timezone (e.g. `Europe/Istanbul` is set in the script).
3. Point your form or client to `patient_registration.php` with a POST request containing the required/optional fields above.

### 3. Optional: `db_connect.php` example

```php
<?php
function db_connect() {
    $conn = new mysqli("127.0.0.1", "your_user", "your_password", "hospital");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $conn->set_charset("utf8mb4");
    return $conn;
}
```

---

## 👥 User Roles

Defined in `usertype` and used by `users`:

```mermaid
pie title User types in system
    "Patient" : 9
    "Nurse" : 1
    "Physician" : 2
    "Lab Technician" : 3
    "Doctor" : 4
    "Manager" : 5
    "Patient Registrar" : 6
    "Accountant" : 7
    "IT Support Specialist" : 8
```

| userTypeID | Role |
|------------|------|
| 1 | Nurse |
| 2 | Physician |
| 3 | Lab Technician |
| 4 | Doctor |
| 5 | Manager |
| 6 | Patient Registrar |
| 7 | Accountant |
| 8 | IT Support Specialist |
| 9 | Patient |

---

## 📜 License & Assignment

This project was developed as a **Database course assignment (Assignment 02)**. Use and modification for educational purposes is encouraged.

---

<p align="center">
  <sub>Built with MariaDB, PHP, and Mermaid</sub>
</p>
