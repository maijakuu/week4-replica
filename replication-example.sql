-- Example only. Replace the log coordinates with those from a
-- fresh, consistent dump before setting up a new replica.
-- Keep the real password out of this repository.

CHANGE REPLICATION SOURCE TO
  SOURCE_HOST = '95.217.237.75',
  SOURCE_PORT = 3306,
  SOURCE_USER = 'replica',
  SOURCE_PASSWORD = 'REPLACE_WITH_SECRET',
  SOURCE_LOG_FILE = 'REPLACE_WITH_DUMP_LOG_FILE',
  SOURCE_LOG_POS = 0,
  SOURCE_SSL = 1,
  SOURCE_SSL_CA = '/etc/mysql/mysql-a-ca.pem';

-- Run on B after importing the initial database copy.
START REPLICA;
SET PERSIST super_read_only = ON;
