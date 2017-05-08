#!/bin/bash

source env.sh

# This is what I use for refreshing my development copy of the XRAS database on
# my laptop.  Passwords are stored in my ~/.pgpass file so I don't need them
# here.
DB_SOURCE_HOST="localhost"
LOCAL_DBNAME="xras_admin"
PGUSER="xras"
DB_NAME="xras_admin"
DB_USER_XRAS="xsede_user"

# clean_up ()
# {
# 	echo "Cleaning up."
# 	rm -rf "${TEMPDIR}"
# }

dump_xras ()
{
	# ~ 37MB
	pg_dump \
		--no-privileges --no-owner \
		--host=$DB_SOURCE_HOST \
		--username=$DB_USER_XRAS \
		--dbname=$DB_NAME \
		--schema=xras \
		--exclude-table-data=xras.action_documents \
		--format=custom --file="${TEMPDIR}/xras.dump"
}

dump_xras_acct ()
{
	# ~ 3.1MB
	pg_dump \
		--no-privileges --no-owner \
		--host=$DB_SOURCE_HOST \
		--username=$DB_USER_XRAS \
		--dbname=$DB_NAME \
		--schema=xras_acct \
		--format=custom --file="${TEMPDIR}/xras_acct.dump"
}

dump_acct ()
{
	# ~ 47MB
	# Restoring acct requires plperl to be installed
	pg_dump \
		--no-privileges --no-owner \
		--host=$DB_SOURCE_HOST \
		--username=$DB_USER_XRAS \
		--dbname=$DB_NAME \
		--schema=acct \
		--exclude-table-data=acct.jobs \
		--exclude-table-data=acct.grid_jobs \
		--format=custom --file="${TEMPDIR}/acct.dump"
}

dump_source_database ()
{
	echo "Retrieving database from $DB_SOURCE_HOST... "
	dump_xras && dump_xras_acct && dump_acct
}


disconnect_users ()
{
	# https://dba.stackexchange.com/questions/11893/force-drop-db-while-others-may-be-connected
	# https://www.postgresql.org/docs/9.5/static/sql-alterdatabase.html

	echo "Dropping any active connections..."
	psql >/dev/null <<-END_DISCONNECT
		UPDATE pg_database SET datallowconn = 'false' WHERE datname = '${LOCAL_DBNAME}';
		SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '${LOCAL_DBNAME}';
	END_DISCONNECT
}

# drop_local_database ()
# {
# 	echo "Dropping local database..."
# 	dropdb "${LOCAL_DBNAME}"
# }
#
# create_local_database ()
# {
# 	createdb "${LOCAL_DBNAME}" \
# 		&& set_search_path \
# 		&& install_extensions
# }
#
# restore () {
# 	pg_restore --no-owner --dbname="${LOCAL_DBNAME}" "${1}"
# }
#
# restore_local_database ()
# {
# 	echo "Restoring local database..."
#
# 	# NOTE:  Restoring xras_acct will cause errors because VIEWs reference the acct.* schema;
# 	# these are harmless, so we'll ignore the exit code.
# 	restore "${TEMPDIR}/acct.dump"
# 	restore "${TEMPDIR}/xras_acct.dump"
# 	restore "${TEMPDIR}/xras.dump"
# 	localize_supporting_services
# }

set_search_path ()
{
	psql "${LOCAL_DBNAME}" <<-END_SEARCH_PATH
		ALTER DATABASE "${LOCAL_DBNAME}" SET search_path TO xras, xras_acct;
	END_SEARCH_PATH
}

# install_extensions ()
# {
# 	psql "${LOCAL_DBNAME}" <<-END_EXTENSIONS
# 		CREATE EXTENSION plperl;
# 	END_EXTENSIONS
# }

# This is broken.
# (For now it should be 2 XSEDE services b/c accounting has been temporarily disabled.)
# (However, it is still failing for the other two.)
# Maybe this should just create rows instead?
# set_service ()
# {
# 	psql "${LOCAL_DBNAME}" <<-END_SUPPORTING_SERVICES
# 		UPDATE supporting_services
# 			SET base_url = '$2'
# 		FROM
# 			allocations_processes
# 			INNER JOIN allocations_process_supporting_services USING (allocations_process_id)
# 			, supporting_service_types
# 		WHERE
# 			supporting_services.supporting_service_type_id = supporting_service_types.supporting_service_type_id
# 			AND allocations_process_supporting_services.supporting_service_id = supporting_services.supporting_service_id
# 			AND supporting_services.is_active = 't'
# 			AND allocations_process_name_abbr = 'XSEDE'
# 			AND supporting_service_types.supporting_service_type = '$1';
# 	END_SUPPORTING_SERVICES
# }
#
# localize_supporting_services ()
# {
# 	# I run local copies of these services, so update xras.supporting_services
# 	# to reference them instead.
# 	set_service "RulesService"      "http://localhost:3002/api/v1/xras_admin"
# 	set_service "AccountingService" "http://localhost:3003/v1"
# 	set_service "IdentityService"   "http://localhost:3004/v1"
# }

TEMPDIR=$(mktemp -d -t xras_admin_$timestamp)
echo "Created tmp directory ${TEMPDIR}"
echo "Dumping database [ $DB_NAME ] on host [ $DB_SOURCE_HOST ]..."

dump_source_database

# Move to backup folder
mv $TEMPDIR ~/Development/sql/postgres/data/backups/

# clean_up
