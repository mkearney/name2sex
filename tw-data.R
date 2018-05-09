
w <- rtweet::search_users('"i\'m a woman"', n = 1000)
w2 <- rtweet::search_users('"i\'m a lady"', n = 1000)
w3 <- rtweet::search_users('"i am a woman"', n = 1000)
m <- rtweet::search_users('"i\'m a man"', n = 1000)
m2 <- rtweet::search_users('"i\'m a gentleman"', n = 1000)
m3 <- rtweet::search_users('"i am a man"', n = 1000)
w <- unique(dplyr::bind_rows(w, w2, w3))
w$gender <- "woman"
m <- unique(dplyr::bind_rows(m, m2, m3))
m$gender <- "man"
vars <- c("user_id", "gender", "screen_name", "name")
mw <- rbind(m[vars], w[vars])
saveRDS(mw, "mw.rds")
