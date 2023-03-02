/*
8. Create Procedures

Kristiyan Stoilov */

use aragon_library_kraj; 

/* 1. How many loans did the library do last year? */
DELIMITER $$

CREATE PROCEDURE GetTotalLoans()
BEGIN
DECLARE totalLoans INT DEFAULT 0;

SELECT COUNT(history.HistoryID)
FROM History as history
WHERE YEAR(CURDATE()) = YEAR(history.HistoryCheckoutDate)
INTO totalLoans;

INSERT INTO Statistics (StatisticsTotalLoans) VALUES (totaLoans);
END$$

DELIMITER ;
 
 
/* 2 What percentage of the membership borrowed at least one book? */
DELIMITER $$

CREATE PROCEDURE GetPercentageMembersBorrowed()
BEGIN
DECLARE percentage DOUBLE DEFAULT 0.00;
DECLARE membersCount INT DEFAULT 0;
DECLARE totalMembers INT DEFAULT 0;

SELECT COUNT(DISTINCT history.HistoryMemberID)
FROM History as history
WHERE YEAR(CURDATE()) = YEAR(history.HistoryCheckoutDate)
INTO membersCount;

SELECT COUNT(members.MemberID)
FROM Members as members
WHERE YEAR(CURDATE()) = YEAR(history.HistoryCheckoutDate)
INTO totalMembers;

SELECT (membersCount/totalMembers*100)
INTO percentage;

INSERT INTO Statistics (StatisticPercentageMembersBorrowed) VALUES (percentage);
END$$

DELIMITER ;

/* 3 What was the greatest number of books borrowed by any one individual? */

DELIMITER $$
CREATE PROCEDURE GetPercentageBooksLoaned() 
BEGIN
DECLARE percentage DOUBLE DEFAULT 0.00;
DECLARE booksCount INT DEFAULT 0;
DECLARE totalBooks INT DEFAULT 0;

SELECT COUNT(DISTINCT history.HistoryBookID)
FROM History as history
WHERE YEAR(CURDATE()) = YEAR(history.HistoryCheckoutDate)
INTO booksCount;

SELECT COUNT(books.BookID)
FROM Books as book
WHERE YEAR(CURDATE()) = YEAR(history.HistoryCheckoutDate)
INTO totalBooks;

SELECT (booksCount/totalBooks*100)
INTO percentage;

INSERT INTO Statistics (StatisticPercentageMembersBorrowed) VALUES (percentage);
END$$
DELIMITER ;