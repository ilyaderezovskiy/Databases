CREATE TABLE "Patients" (
  "patientNr" integer PRIMARY KEY,
  "name" text,
  "disease" text,
  "stationNr" integer,
  "roomNr" integer,
  "docNr" integer
);

CREATE TABLE "Rooms" (
  "roomNr" integer,
  "beds" integer,
  "stationNr" integer,
  "admissionFrom" timestamp,
  "admissionTo" timestamp,
  PRIMARY KEY ("roomNr", "stationNr")
);

CREATE TABLE "Stations" (
  "statNr" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE "StationPersonell" (
  "persNr" integer PRIMARY KEY,
  "stationNr" integer,
  "name" text
);

CREATE TABLE "Caregivers" (
  "persNr" integer,
  "qualification" text
);

CREATE TABLE "Doctors" (
  "persNr" integer PRIMARY KEY,
  "rank" text,
  "area" text
);

ALTER TABLE "Patients" ADD FOREIGN KEY ("stationNr", "roomNr") REFERENCES "Rooms" ("stationNr", "roomNr");

ALTER TABLE "Patients" ADD FOREIGN KEY ("docNr") REFERENCES "Doctors" ("persNr");

ALTER TABLE "Rooms" ADD FOREIGN KEY ("stationNr") REFERENCES "Stations" ("statNr");

ALTER TABLE "StationPersonell" ADD FOREIGN KEY ("stationNr") REFERENCES "Stations" ("statNr");

ALTER TABLE "Caregivers" ADD FOREIGN KEY ("persNr") REFERENCES "StationPersonell" ("persNr");

ALTER TABLE "Doctors" ADD FOREIGN KEY ("persNr") REFERENCES "StationPersonell" ("persNr");
