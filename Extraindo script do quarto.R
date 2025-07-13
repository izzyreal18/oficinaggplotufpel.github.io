# Caminho para o arquivo .qmd
arquivo_qmd <- "index.qmd"

# Ler o conteúdo inteiro
linhas <- readLines(arquivo_qmd, warn = FALSE)

# Variáveis de controle
em_chunk <- FALSE
codigo_extraido <- c()
contador_chunk <- 0

for (linha in linhas) {
  # Detectar início de chunk R
  if (grepl("^```\\{r.*\\}", linha)) {
    em_chunk <- TRUE
    contador_chunk <- contador_chunk + 1
    codigo_extraido <- c(
      codigo_extraido,
      paste0("# ---- Chunk ", contador_chunk, " ----")
    )
    next
  }
  
  # Detectar fim de chunk
  if (em_chunk && grepl("^```", linha)) {
    em_chunk <- FALSE
    codigo_extraido <- c(codigo_extraido, "") # linha em branco entre chunks
    next
  }
  
  # Se está dentro de chunk, adicionar linha
  if (em_chunk) {
    codigo_extraido <- c(codigo_extraido, linha)
  }
}

# Escrever em arquivo .R
arquivo_saida <- sub("\\.qmd$", ".R", arquivo_qmd)
writeLines(c("# Código extraído de:", arquivo_qmd, "", codigo_extraido), arquivo_saida)

cat("Código extraído para", arquivo_saida, "\n")



# Caminho do arquivo R gerado anteriormente
arquivo_r <- "index.R"

# Ler as linhas do arquivo
linhas <- readLines(arquivo_r, warn = FALSE)

# Função para remover ' #|' e tudo após, mantendo o resto da linha
remover_hash_pipe <- function(linha) {
  # Se linha começa com #|, retorna "" (remove a linha)
  if (grepl("^\\s*#\\|", linha)) {
    return("")
  }
  # Se linha contém #| em qualquer parte, remove de #| em diante
  sub("\\s*#\\|.*$", "", linha)
}

# Aplicar a função em todas as linhas
linhas_limpo <- vapply(linhas, remover_hash_pipe, character(1))

# Opcional: remover linhas em branco extras
linhas_limpo <- linhas_limpo[linhas_limpo != ""]

# Gerar arquivo de saída limpo
arquivo_saida <- sub("\\.R$", "_limpo.R", arquivo_r)
writeLines(linhas_limpo, arquivo_saida)

cat("Script limpo gerado em:", arquivo_saida, "\n")

