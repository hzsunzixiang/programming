#include <iostream>
#include <fstream>
#include <string>
#include "addressbook.pb.h"
using namespace std;

// Iterates though all people in the AddressBook and prints info about them.
void ListPeople(const tutorial::AddressBook& address_book) {
	for (int i = 0; i < address_book.people_size(); i++) {
		const tutorial::Person& person = address_book.people(i);

		cout << "Person ID: " << person.id() << endl;
		cout << "  Name: " << person.name() << endl;
		if (person.has_email()) {
			cout << "  E-mail address: " << person.email() << endl;
		}

		for (int j = 0; j < person.phones_size(); j++) {
			const tutorial::Person::PhoneNumber& phone_number = person.phones(j);

			switch (phone_number.type()) {
				case tutorial::Person::MOBILE:
					cout << "  Mobile phone #: ";
					break;
				case tutorial::Person::HOME:
					cout << "  Home phone #: ";
					break;
				case tutorial::Person::WORK:
					cout << "  Work phone #: ";
					break;
			}
			cout << phone_number.number() << endl;
		}
	}
}


// #ifndef SerializeMsgMacro
// #define SerializeMsgMacro(msg)                                                                                                                          
//     char msg##__[BPT_MAX_PACKET_LENGTH];
//     assert(msg.SerializePartialToArray(msg##__, sizeof(msg##__))); 
//     unsigned int msg##_size__ = msg.ByteSize();
// #endif

// Main function:  adds one person then read it.
int main(int argc, char* argv[]) {
	// Verify that the version of the library that we linked against is
	// compatible with the version of the headers we compiled against.
	GOOGLE_PROTOBUF_VERIFY_VERSION;

	tutorial::AddressBook address_book;

	//// Add an address.
	{
		::tutorial::Person* person = address_book.add_people();

		int id = 1234567890;
		person->set_id(id);
		char name[32] = "StephenSun";
		person->set_name(name);
		person->set_email("haichengsun123@163.com");

		{
			tutorial::Person::PhoneNumber* phone_number = person->add_phones();
			phone_number->set_number("135555555555");
			phone_number->set_type(tutorial::Person::MOBILE);
		}
		{
			tutorial::Person::PhoneNumber* phone_number = person->add_phones();
			phone_number->set_number("075588888888");
			phone_number->set_type(tutorial::Person::HOME);
		}
	}
	//// Add an address.
	{
		::tutorial::Person* person = address_book.add_people();

		int id = 678901534;
		person->set_id(id);
		char name[32] = "haicheng";
		person->set_name(name);
		person->set_email("17842379@163.com");

		{
			tutorial::Person::PhoneNumber* phone_number = person->add_phones();
			phone_number->set_number("13888888888");
			phone_number->set_type(tutorial::Person::MOBILE);
		}
		{
			tutorial::Person::PhoneNumber* phone_number = person->add_phones();
			phone_number->set_number("075577777777");
			phone_number->set_type(tutorial::Person::HOME);
		}
	}
	ListPeople(address_book);

#define FILENAME "text.txt"
	{
		// Write the new address book back to disk.
		fstream output(FILENAME, ios::out | ios::trunc | ios::binary);
		if (!address_book.SerializeToOstream(&output)) {
			cerr << "Failed to write address book." << endl;
			return -1;
		}
	}

	tutorial::AddressBook address_book_1;
	{
		// Read the existing address book.
		fstream input(FILENAME, ios::in | ios::binary);
		if (!address_book_1.ParseFromIstream(&input)) {
			cerr << "Failed to parse address book." << endl;
			return -1;
		}
	}
	cout<< "after ParseFromIstream:" << endl;
	ListPeople(address_book_1);

	// Optional:  Delete all global objects allocated by libprotobuf.
	google::protobuf::ShutdownProtobufLibrary();

	return 0;
}
