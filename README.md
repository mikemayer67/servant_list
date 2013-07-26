servant_list
============
Portable website for managing servants lists for CTS
============

The purpose of this project is to create a sign-up list for recurring events
with multiple volunteer roles that must be filled.  Unlike signup genius, the
intent is that only those with administrative priviledges may update the lists.

In no particular order, these are some of the required design features.

- There will be a few standard events (common set of roles) + a handful of special events (different set of roles)

- Coordinators may update only their area of responsibility (set of roles)

- Admin may update any area of responsibility

- Anyone may view the current sign up list (no login required... or general login)

- Certain roles for any given event are mutually exclusive, others are not

- Admin or coordinators may add new volunteers to the database

- Volunteers may express an interest in a particular role or roles

- Coordinators may fill roles with volunteers that either have or have not expressed an interest in that role

- Admins / Coordinators may change their password
   - Admin password must be resettable via database change (e.g. blanking it out)

- Roles defined in database via input screen
  - Admin only

- Events defined in database via input screen
  - Event templates defined in database via input screen
  - Admin only

- For portability, database connections defined in a single config file
