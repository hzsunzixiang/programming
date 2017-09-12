#include "access_task_manager.h"

bool AccessTaskVerifyManager::addTask(AccessTask *t) {
	return this->push((ZEntry*)t);
}

void AccessTaskVerifyManager::removeTask(AccessTask *t) {
	this->remove((ZEntry*)t);
}

AccessTask* AccessTaskVerifyManager::getTaskById(const uint64 id) {
	return (AccessTask*)this->getEntryByID(id);
}
