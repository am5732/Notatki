# Tworzenie chmury słów za pomocą pakietu wordcloud
install.packages("wordcloud")
library(wordcloud)
library(qdap)
# Opcje chmury słów
?wordcloud
# Zmiana wartości min.freq i max.words w celu wyświetlenia mniejszej/większej liczby słów.
# min.freq: słowa o częstości poniżej tej wartości nie będą wyświetlane
# max.words: maksymalna liczba słów do wyświetlenia

# Wczytaj dane tekstowe
# Wczytaj plik tekstowy z lokalnego dysku
text <- readLines(file.choose())
text

frequent_terms <- freq_terms(text)
frequent_terms
frequent_terms <- freq_terms(text, stopwords = Top200Words)
plot(frequent_terms)

# Utwórz chmurę słów
wordcloud(frequent_terms$WORD, frequent_terms$FREQ)

# Ograniczenie liczby słów w chmurze poprzez określenie minimalnej częstości
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4)

# Ograniczenie liczby słów w chmurze poprzez określenie maksymalnej liczby słów
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5)

wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Blues"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Reds"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9,"Greens"))

# Optymalizacja i dostosowanie wyników
# Dodanie koloru do chmury słów dla lepszej wizualizacji
# Dodanie koloru
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(8,"Dark2"))
# Dodanie koloru
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5, colors = brewer.pal(8,"Accent"))
?brewer.pal
brewer.pal.info


biden2021 <- readLines(file.choose())
biden2024 <- readLines(file.choose())

frequent_terms2021 <- freq_terms(biden2021, stopwords = Top200Words)
frequent_terms2024 <- freq_terms(biden2024, stopwords = Top200Words)

par(mfrow = c(1, 2))
wordcloud(frequent_terms2021$WORD, frequent_terms2021$FREQ)
wordcloud(frequent_terms2024$WORD, frequent_terms2024$FREQ)

wordcloud(frequent_terms2021$WORD, frequent_terms2021$FREQ, min.freq = 4)
wordcloud(frequent_terms2024$WORD, frequent_terms2024$FREQ, min.freq = 4)

wordcloud(frequent_terms2021$WORD, frequent_terms2021$FREQ, max.words = 5)
wordcloud(frequent_terms2024$WORD, frequent_terms2024$FREQ, max.words = 5)
par(mfrow = c(1, 1))

# Mowi o niektorych podobnych rzeczach ale glowny element rozmowy schodzi z odbiorcow na prezentujacego