create table Admins (
username varchar (50) not null,
password varchar (50) not null
CONSTRAINT pk_Admin PRIMARY KEY ( username, password)
);

create table Directors (
directorID int identity(1,1) PRIMARY KEY ,
firstName varchar (20) not null,
lastName varchar (20) not null,
CONSTRAINT uc_Directors UNIQUE (firstName,lastName),
directorAge int not null
);

create table Actors (
actorID int identity (1,1) PRIMARY KEY,
firstName varchar (50) not null,
lastName varchar (50) not null,
CONSTRAINT uc_Actors UNIQUE (firstName,lastName),
actorAge int not null
);

create table Movies (
directorID int FOREIGN KEY REFERENCES Directors (directorID) ,
name varchar(50) PRIMARY KEY,
category varchar(50) not null,
paragraph varchar(Max) not null,
image image
);

create table ActsIn (
actorID int not null FOREIGN KEY REFERENCES Actors(actorID),
movieName varchar(50) not null FOREIGN KEY REFERENCES Movies(name),
CONSTRAINT pk_ActsIn PRIMARY KEY (actorID,movieName)
);

create table User_fv_Movies (
userID int not null FOREIGN KEY REFERENCES Users(ID),
movieName varchar(50) not null FOREIGN KEY REFERENCES Movies(name),
CONSTRAINT pk_FavMovies PRIMARY KEY (userID,movieName)
);

create table User_fv_Actors (
userID int not null FOREIGN KEY REFERENCES Users(ID) ,
actorID int not null ,
CONSTRAINT fk_FavActors FOREIGN KEY (actorID) REFERENCES Actors(actorID),
CONSTRAINT pk_FavActors PRIMARY KEY (userID,actorID)
);

create table User_fv_directors (
userID int not null FOREIGN KEY REFERENCES Users(ID),
directorID int not null,
CONSTRAINT fk_FavDirectors FOREIGN KEY (directorID) REFERENCES Directors(directorID),
CONSTRAINT pk_FavDirectors PRIMARY KEY (userID,directorID)
);

create table user_comment(
userID int not null FOREIGN KEY REFERENCES Users(ID),
movie_name varchar(50) not null FOREIGN KEY REFERENCES Movies(name),
comment varchar(Max) not null,
);
