require(ROracleUI)

query <- "SELECT sysdate FROM dual"  # character
drv <- dbDriver("Oracle")            # OraDriver
con <- dbConnect(drv)                # OraConnection
res <- dbSendQuery(con, query)       # OraResult
out <- fetch(res, n=-1)              # data.frame
dbClearResult(res)
suppressWarnings(dbUnloadDriver(dbDriver("Oracle")))

query <- "SELECT sysdate FROM dual"  # or "file.sql"
out <- sql(query)

desc("fiskar.stodvar")
tables(owner="fiskar")
tables(table="%tegund%")
views(owner="fiskar")

x <- sql("SELECT username,created FROM all_users")
y <- sql(paste("SELECT username,",
               to_char(created),
               "FROM all_users"))
z <- sql("SELECT username,
         to_char(created,'YYYY-MM-DD HH24:MI:SS')
         AS created FROM all_users")
