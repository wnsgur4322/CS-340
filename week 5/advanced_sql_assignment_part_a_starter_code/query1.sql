-- Write the query to create the 4 tables below.
CREATE TABLE client (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  CONSTRAINT full_name UNIQUE (first_name, last_name),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE employee (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `date_joined` date NOT NULL,
  CONSTRAINT full_name UNIQUE (first_name, last_name),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE project (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int,
  `name` varchar(255) UNIQUE NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`cid`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE works_on (
  `eid` int,
  `pid` int,
  `start_date` date NOT NULL,
  FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  FOREIGN KEY (`pid`) REFERENCES `project` (`id`),
  PRIMARY KEY (`eid`, `pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created 
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE REFERENCED_TABLE_SCHEMA = 'grade';

