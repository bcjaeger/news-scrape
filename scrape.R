library(httr2)

cat("The key is ", Sys.getenv("NEWS_API_KEY"), file = stderr())

req <- request("https://newsapi.org/v2/everything") |>
  req_url_query(
    q = '`"data science"`',
    from = Sys.Date() - 1,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )
resp <- req_perform(req)

todays_date <- Sys.Date()
fname <- paste0(todays_date, '.json')

saveRDS(resp_body_json(resp), file = file.path('data', fname))

