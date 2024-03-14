#! /usr/bin/env bash
# ============================================================================ #
#
# Initialize `sakila' database.
#
# ---------------------------------------------------------------------------- #

set -eu;
set -o pipefail;


# ---------------------------------------------------------------------------- #

_as_me="init.bash";

_version="0.1.0";

_usage_msg="USAGE: $_as_me [OPTIONS...]
Initialize \`sakila' database.
";

_help_msg="$_usage_msg

OPTIONS
  -h,--help         Print help message to STDOUT.
  -u,--usage        Print usage message to STDOUT.
  -v,--version      Print version information to STDOUT.

ENVIRONMENT
  GREP              Command used as \`grep' executable.
  MYSQL             Command used as \`mysql' executable.
  REALPATH          Command used as \`realpath' executable.
";


# ---------------------------------------------------------------------------- #

usage() {
  if [[ "${1:-}" = "-f" ]]; then
    echo "$_help_msg";
  else
    echo "$_usage_msg";
  fi
}


# ---------------------------------------------------------------------------- #

# @BEGIN_INJECT_UTILS@
: "${GREP:=grep}";
: "${MYSQL:=mysql}";
: "${REALPATH:=realpath}";


# ---------------------------------------------------------------------------- #

#_es=0;
#trap '_es="$?"; exit "$_es";' HUP TERM INT QUIT EXIT;


# ---------------------------------------------------------------------------- #

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    # Split short options such as `-abc' -> `-a -b -c'
    -[^-]?*)
      _arg="$1";
      declare -a _args;
      _args=();
      shift;
      _i=1;
      while [[ "$_i" -lt "${#_arg}" ]]; do
        _args+=( "-${_arg:$_i:1}" );
        _i="$(( _i + 1 ))";
      done
      set -- "${_args[@]}" "$@";
      unset _arg _args _i;
      continue;
      ;;
    --*=*)
      _arg="$1";
      shift;
      set -- "${_arg%%=*}" "${_arg#*=}" "$@";
      unset _arg;
      continue;
      ;;
    -u|--usage)    usage;    exit 0; ;;
    -h|--help)     usage -f; exit 0; ;;
    -v|--version)  echo "$_version"; exit 0; ;;
    --) shift; break; ;;
    -?|--*)
      echo "$_as_me: Unrecognized option: '$1'" >&2;
      usage -f >&2;
      exit 1;
      ;;
    *)
      echo "$_as_me: Unexpected argument(s) '$*'" >&2;
      usage -f >&2;
      exit 1;
      ;;
  esac
  shift;
done


# ---------------------------------------------------------------------------- #

_abs_me="$( $REALPATH "${BASH_SOURCE[0]}"; )";
_abs_dir="${_abs_me%/*}";


# ---------------------------------------------------------------------------- #

_SCHEMA_SQL="$_abs_dir/sakila-schema.sql";
_DATA_SQL="$_abs_dir/sakila-data.sql";


# ---------------------------------------------------------------------------- #

# Delete database if it exists.
if { $MYSQL --execute='SHOW DATABASES'||:; }|$GREP -q '\bsakila\b'; then
  echo "$_as_me: deleting existing \`sakila' database" >&2;
  $MYSQL --execute='DROP DATABASE sakila';
fi

# Create the database.
echo "$_as_me: creating \`sakila' database" >&2;
$MYSQL < "$_SCHEMA_SQL";
$MYSQL < "$_DATA_SQL";


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
