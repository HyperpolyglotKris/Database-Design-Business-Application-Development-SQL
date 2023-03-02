/*
1. Database

Kristiyan Stoilov */

create database if not exists aragon_library_kraj;

use aragon_library_kraj;

create table Members
(
	memberID int,
	memberFirstName varchar(64),
	memberMiddleName varchar(64),
	memberLastName varchar(64),
	memberTypeID int,
	memberReferenceID int
);

create table MembershipTypes
(
	membershipTypeID int,
	membershipName varchar(64)
);

create table Adults
(
	adultID int,
	adultExpiryDate date,
	adultAddressLine1 varchar(128),
	adultAddressLine2 varchar(128),
	adultAddressCity varchar(32),
	adultAddressProvince varchar(32),
	adultAddressZipCode varchar(6),
	adultPhotograph varchar(256),
	adultPhoneNumber bigint
);

create table Juveniles
(
	juvenileMemberID int,
	juvenileAdultID int,
	juvenileDateOfBirth date
);

create table Books
(
	bookID int,
	bookISBN bigint,
	bookTitle varchar(128),
	bookLanguage varchar(32),
	bookSynopsys varchar(512),
	bookBindingtype varchar(32)
);

create table ActiveLoans
(
	activeLoanBookID int,
	activeLoanMemberID int,
	activeLoanHistoryID int
);

create table Reservations
(
	reservationBookID int,
	reservationMemberID int,
	reservationDate date
);

create table Statistics
(
	statisticID int,
	statisticYear int,
	statisticTotalLoans int,
	statisticPercentageMembersBorrowed double,
	statisticRecordBooksBorrowed int,
	statisticPercentageBooksBorrowed double,
	statisticPercentageOverdue double,
	statisticAverageLoanLength double,
	statisticPeakHour int
);

create table History
(
	historyID int,
	historyMemberID int,
	historyBookID int,
	historyCheckoutDate datetime,
	historyExpectedReturn date,
	historyReturnDate date
);