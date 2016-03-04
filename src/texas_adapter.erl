-module(texas_adapter).

-export_type([
              connection/0,
              connection_error/0,
              request_error/0,
              tablename/0,
              data/0,
              clause_type/0,
              clause/0,
              clauses/0
             ]).

-type connection() :: any().
-type connection_error() :: any().
-type request_error() :: any().
-type tablename() :: atom().
-type data() :: any().
-type clause_type() :: where | group | order | limit.
-type clause() :: {clause_type(), string(), [tuple()]} |
                  {clause_type(), string(), []}.
-type clauses() :: [clause()] | [].

-callback start() -> ok.
-callback connect(User :: string(),
                  Password :: string(),
                  Server :: string(),
                  Port :: integer(),
                  Database :: string(),
                  Options :: any()) ->
  {ok, connection()}
  | {error, connection_error()}.
-callback close(Conn :: connection()) -> 
  ok 
  | error.

-callback create_table(Conn :: connection(), 
                       Table :: tablename()) -> 
  ok 
  | error.
-callback create_table(Conn :: connection(), 
                       Table :: tablename(), 
                       Fields :: list()) -> 
  ok 
  | error.
-callback drop_table(Conn :: connection(), 
                     Table :: tablename()) -> 
  ok 
  | error.

-callback insert(Conn :: connection(), 
                 Table :: tablename(), 
                 Record :: data() | list()) -> 
  data() 
  | ok 
  | {error, request_error()}.
-callback select(Conn :: connection(), 
                 Table :: tablename(), 
                 Type :: first | all, 
                 Clauses :: clauses()) ->
  data() 
  | [data()] 
  | [] 
  | {error, request_error()}.
-callback count(Conn :: connection(), 
                Table :: tablename(), 
                Clauses :: clauses()) -> 
  integer().
-callback update(Conn :: connection(), 
                 Table :: tablename(), 
                 Record :: data(), 
                 UpdateData :: [tuple()]) -> 
  [data()] 
  | {error, request_error()}.
-callback delete(Conn :: connection(), 
                 Table :: tablename(), 
                 Record :: data()) -> 
  ok 
  | {error, request_error()}.

-callback string_separator() -> 
  char().
-callback string_quote() -> 
  char().
-callback field_separator() -> 
  char().
-callback where_null(OP :: string(), 
                     Key :: string()) -> 
  string().
-callback set_null(Key :: string()) -> 
  string().

