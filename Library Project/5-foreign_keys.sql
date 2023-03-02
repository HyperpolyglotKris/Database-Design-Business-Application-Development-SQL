/*
5. Foreign Keys

Kristiyan Stoilov */

use aragon_library_kraj;

alter table Members
	add foreign key (memberTypeID) references MembershipTypes(membershipTypeID),
	add foreign key (memberReferenceID) references Adults(adultID),
    add foreign key (memberReferenceID) references Juveniles(juvenileMemberID);
    
alter table Juveniles
	add foreign key (juvenileAdultID) references Adults(adultID);
    
alter table ActiveLoans
	add foreign key (activeLoanBookID) references Books(bookID),
    add foreign key (activeLoanMemberID) references Members(memberID),
	add foreign key (activeLoanHistoryID) references History(historyID);
    
alter table Reservations
	add foreign key (reservationBookID) references Books(bookID),
    add foreign key (reservationMemberID) references Members(memberID);
    
alter table History
	add foreign key (historyMemberID) references Members(memberID),
    add foreign key (historyBookID) references Books(bookID);