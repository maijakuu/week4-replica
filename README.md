# Week 4: MySQL replica and website backups

Server A hosts the original Week 2 counter at
http://95.217.237.75/viikko2/.

Server B hosts a read-only counter page at
http://86.50.231.80/viikko4/. It reads B's local MySQL replica;
loading it does not increment the counter.

B was created as a separate Ubuntu 24.04 server. The required frontend
files, database data, and configuration were transferred or recreated
on B rather than creating B from a snapshot.

The repository was created after the initial server setup. Its commits
group the files into logical stages and do not represent the exact times
when the server changes were made.

Do not commit database dumps, backups, passwords, or private keys.
