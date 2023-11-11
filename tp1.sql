
CREATE TABLE Wilaya (
  CodeWilaya NUMBER PRIMARY KEY,
  NomWilaya VARCHAR2(50) NOT NULL
);

-- Creating the Ville table
CREATE TABLE Ville (
  CodeVille NUMBER PRIMARY KEY,
  nom_ville VARCHAR2(50) NOT NULL,
  ID_wilaya NUMBER
);

-- Creating the Hopital table
CREATE TABLE Hopital (
  code_hopital NUMBER PRIMARY KEY,
  nom_hopital VARCHAR2(50) NOT NULL,
  ID_wilaya NUMBER
);

-- Creating the Spécialité table
CREATE TABLE Spécialité (
  ID_spec NUMBER PRIMARY KEY,
  Nom_specialité VARCHAR2(50) NOT NULL
);

-- Creating the Grade table
CREATE TABLE Grade (
  Titre VARCHAR2(50) PRIMARY KEY,
  description VARCHAR2(100) NOT NULL
);

-- Creating the Médecin table
CREATE TABLE Médecin (
  CodeMedecin NUMBER PRIMARY KEY,
  NomMedecin VARCHAR2(50) NOT NULL,
  CodeGrade VARCHAR2(50),
  LibelléGrade VARCHAR2(100),
  CodeSpecialité NUMBER,
  LibelléSpécialité VARCHAR2(50)
);

-- Creating the Patient table
CREATE TABLE Patient (
  CodePat NUMBER PRIMARY KEY,
  NomPat VARCHAR2(50) NOT NULL,
  SexePat VARCHAR2(1) CHECK (SexePat IN ('M', 'F')),
  CodeVille NUMBER,
  NomVille VARCHAR2(50),
  CodeWilaya NUMBER,
  NomWilaya VARCHAR2(50)
);

-- Creating the Service table
CREATE TABLE Service (
  CodeService NUMBER PRIMARY KEY,
  NomService VARCHAR2(50) NOT NULL,
  CodeHopital NUMBER
);

-- Creating the Hospitalisation table
CREATE TABLE Hospitalisation (
  ID_hospitalisation NUMBER PRIMARY KEY,
  date_hospitalisation TIMESTAMP,
  nombre_jours NUMBER,
  tarif NUMBER,
  ID_patient NUMBER,
  ID_service NUMBER,
  ID_medecin NUMBER
);

-- Creating the Analyse table
CREATE TABLE Analyse (
  ID_analyse NUMBER PRIMARY KEY,
  Nom_analyse VARCHAR2(50) NOT NULL
);

-- Creating the TypeAnalyse table
CREATE TABLE TypeAnalyse (
  TypeAnalyse VARCHAR2(50) PRIMARY KEY,
  description VARCHAR2(100) NOT NULL
);


ALTER TABLE Ville
ADD CONSTRAINT fk_ville_wilaya
FOREIGN KEY (ID_wilaya) REFERENCES Wilaya(CodeWilaya);


ALTER TABLE Hopital
ADD CONSTRAINT fk_hopital_wilaya
FOREIGN KEY (ID_wilaya) REFERENCES Wilaya(CodeWilaya);


ALTER TABLE Service
ADD CONSTRAINT fk_hopital_service
FOREIGN KEY (CodeHopital) REFERENCES Hopital(code_hopital);

ALTER TABLE Hospitalisation
ADD CONSTRAINT fk_patient_hospitalisation
FOREIGN KEY (ID_patient) REFERENCES Patient(CodePat);

ALTER TABLE Hospitalisation
ADD CONSTRAINT fk_service_hospitalisation
FOREIGN KEY (ID_service) REFERENCES Service(CodeService);

ALTER TABLE Hospitalisation
ADD CONSTRAINT fk_medecin_hospitalisation
FOREIGN KEY (ID_medecin) REFERENCES Médecin(CodeMedecin);


