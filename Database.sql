CREATE DATABASE  IF NOT EXISTS jobportal ;
use jobportal;
#DROP TABLE IF EXISTS adminuser;

CREATE TABLE adminuser (
  username varchar(45) NOT NULL,
  password varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES adminuser WRITE;

INSERT INTO adminuser VALUES ('admin','admin');

UNLOCK TABLES;

select * from adminuser;

DROP TABLE IF EXISTS employer;



CREATE TABLE employer (
  empid int(11) NOT NULL AUTO_INCREMENT,
  cmpname varchar(45) NOT NULL,
  email varchar(45) NOT NULL,
  contactno varchar(45) NOT NULL,
  link varchar(125),
  address varchar(150) NOT NULL,
  city varchar(45) NOT NULL,
  state varchar(45) NOT NULL,
  category varchar(100) NOT NULL,
  about longtext NOT NULL,
  PRIMARY KEY (empid),
  UNIQUE KEY username_UNIQUE (cmpname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES employer WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS jobseeker;

CREATE TABLE jobseeker (
  jskid int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  firstname varchar(45) NOT NULL,
  lastname varchar(45) NOT NULL,
  contactno varchar(45) NOT NULL,
  gender varchar(45) NOT NULL,
  dob varchar(45) NOT NULL,
  email varchar(45) NOT NULL,
  school10 varchar(100) NOT NULL,
  percent10 varchar(5) NOT NULL,
  school12 varchar(100) NOT NULL,
  percent12 varchar(5) NOT NULL,
  education varchar(45) NOT NULL,
  College varchar(100),
  address varchar(125) NOT NULL,
  city varchar(45) NOT NULL,
  state varchar(45) NOT NULL,
  workexp varchar(45) NOT NULL,
  category varchar(100) NOT NULL,
  skills text not null,
  resumefile text NOT NULL,
  PRIMARY KEY (jskid),
  UNIQUE KEY username_UNIQUE (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES jobseeker WRITE;

select * from jobseeker;

alter table jobseeker add column percent12_2 varchar(100) after school12;

select * from jobseeker where username='pevemlord';

UNLOCK TABLES;

DROP TABLE IF EXISTS login;

CREATE TABLE login (
  userid int(11) NOT NULL,
  username varchar(45) NOT NULL,
  password varchar(45) NOT NULL,
  type varchar(45) NOT NULL,
  authorization varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES login WRITE;

UNLOCK TABLES;

select * from login;

delete from login where username='pevemlord';

DROP TABLE IF EXISTS JobDetails;

CREATE TABLE JobDetails(
	jobid int(11) NOT NULL AUTO_INCREMENT,
    jobprofile varchar(125) NOT NULL,
    jobcategory varchar(100) NOT NULL,
    jobtype varchar(100) NOT NULL,
    jobopening varchar(5) NOT NULL,
    workexperience varchar(50) NOT NULL,
    salaryexpected varchar(100) NOT NULL,
    noticeperiod varchar(50) NOT NULL,
    location varchar(200) NOT NULL,
    state varchar(125) NOT NULL,
    createdBy int(11) NOT NULL,
    PRIMARY KEY (jobid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLE JobDetails WRITE;

UNLOCK TABLES;

select * from JobDetails;

DROP TABLE IF EXISTS JobResult;

CREATE TABLE JobResult(
	empid int(11),
	jskid int(11),
    jobid int(11) NOT NULL,
    jobstatus varchar(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLE JobResult WRITE;

UNLOCK TABLES;

select * from JobResult;

DROP TABLE IF EXISTS Activity;

CREATE TABLE Activity(
	activityid bigint NOT NULL AUTO_INCREMENT,
    activitynature varchar(125) NOT NULL,
    activityowner varchar(100) NOT NULL,
    activityuserid int(11) NOT NULL,
    activityresult varchar(100),
    activitydate date NOT NULL,
    activitytime time NOT NULL,
    PRIMARY KEY (activityid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table activity add column ActivityJobID int(11) after ActivityUserID;

LOCK TABLE Activity WRITE;

UNLOCK TABLES;

select * from Activity;
