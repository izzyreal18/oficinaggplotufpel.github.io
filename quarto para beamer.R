# Ler o arquivo existente
arquivo_qmd <- "index.qmd"
linhas <- readLines(arquivo_qmd)

# Criar YAML Beamer
yaml_beamer <- c(
  "---",
  "title: \"Título da Apresentação\"",
  "author: \"Seu Nome\"",
  "date: today",
  "output: beamer_presentation",
  "---",
  ""
)

# Checar se já possui YAML e remover se necessário
if (any(grepl("^---$", linhas))) {
  idx <- which(grepl("^---$", linhas))
  if (length(idx) >= 2) {
    linhas <- linhas[-c(idx[1]:idx[2])]
  }
}

# Juntar o YAML de Beamer com o restante
linhas_beamer <- c(yaml_beamer, linhas)

# Salvar em novo arquivo
arquivo_saida <- sub("\\.qmd$", "_beamer.qmd", arquivo_qmd)
writeLines(linhas_beamer, arquivo_saida)

cat("Arquivo Quarto para Beamer gerado em:", arquivo_saida, "\n")
