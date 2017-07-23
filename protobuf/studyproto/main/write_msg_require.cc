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

	// [libprotobuf FATAL google/protobuf/message_lite.cc:301] CHECK failed: IsInitialized(): Can't serialize message of type "tutorial.AddressBook" because it is missing required fields: people[1].name, people[1].id
	// terminate called after throwing an instance of 'google::protobuf::FatalException'
	//   what():  CHECK failed: IsInitialized(): Can't serialize message of type "tutorial.AddressBook" because it is missing required fields: people[1].name, people[1].id
	// Aborted
	// 
	//// Add an address.
	{
		::tutorial::Person* person = address_book.add_people();

		int id = 678901534;
		// required 字段缺少
		// 而且使用SerializeToArray  而不是SerializePartialToArray
		// 此时会报错 抛出异常
		//person->set_id(id);
		char name[32] = "haicheng";
		//person->set_name(name);
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


	char msgAddress[64*1024] = {0};
	assert(address_book.SerializeToArray(msgAddress, sizeof(msgAddress))); 
	unsigned int msgAddrsize = address_book.ByteSize();
	cout<<"msgAddrsize:\t"<<msgAddrsize<<endl;


	// 
	tutorial::AddressBook address_book_1;
	address_book_1.ParsePartialFromArray(msgAddress, msgAddrsize);

	cout<< "after ParsePartialFromArray:" << endl;
	ListPeople(address_book_1);




	// Optional:  Delete all global objects allocated by libprotobuf.
	google::protobuf::ShutdownProtobufLibrary();

	return 0;
}
