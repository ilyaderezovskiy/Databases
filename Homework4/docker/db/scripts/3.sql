CREATE TABLE Connections (
  departure timestamp,
  arrival timestamp,
  startStation text,
  endStation text,
  startCity text,
  startRegion text,
  endCity text,
  endRegion text,
  trainNr integer,
  PRIMARY KEY (departure, arrival, startRegion, startCity, startStation, endRegion, endCity, endStation, trainNr)
);

CREATE TABLE Trains (
  trainNr integer ,
  length integer,
  startStation text,
  endStation text,
  startCity text,
  startRegion text,
  endCity text,
  endRegion text,
  PRIMARY KEY (trainNr, startRegion, startCity, startStation, endRegion, endCity, endStation)
);

CREATE TABLE Stations (
  name text,
  region text,
  city text,
  tracks integer,
  PRIMARY KEY (name, region, city)
);

CREATE TABLE Cities (
  region text,
  name text,
  PRIMARY KEY (region, name)
);

ALTER TABLE Connections ADD FOREIGN KEY (startRegion, startCity, startStation) REFERENCES Stations (region, city, name);

ALTER TABLE Connections ADD FOREIGN KEY (endRegion, endCity, endStation) REFERENCES Stations (region, city, name);

ALTER TABLE Connections ADD FOREIGN KEY (trainNr, startRegion, startCity, startStation, endRegion, endCity, endStation) REFERENCES Trains (trainNr, startRegion, startCity, startStation, endRegion, endCity, endStation);

ALTER TABLE Trains ADD FOREIGN KEY (startRegion, startCity, startStation) REFERENCES Stations (region, city, name);

ALTER TABLE Trains ADD FOREIGN KEY (endRegion, endCity, endStation) REFERENCES Stations (region, city, name);

ALTER TABLE Stations ADD FOREIGN KEY (region, city) REFERENCES Cities (region, name);