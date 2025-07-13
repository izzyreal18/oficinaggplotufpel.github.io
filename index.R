# Código extraído de:
index.qmd

# ---- Chunk 1 ----
options(repos = c(CRAN = "https://cloud.r-project.org"))

# ---- Chunk 2 ----
#| echo: true
#| message: false
#| warning: false
#| output: false

#instalando pacote ggplot2
install.packages("ggplot2")

#instalando dplyr, forcats e patchwork
install.packages("dplyr")
install.packages("forcats")
install.packages("patchwork")

# ---- Chunk 3 ----
#| echo: true
#| message: false
#| warning: false
#| output: false

#Carregando o pacote ggplot2
library(ggplot2)

#Carregando dplyr, forcats e patchwork
library(dplyr)
library(forcats)
library(patchwork)

# ---- Chunk 4 ----
#| echo: true
data(iris)

head(iris)

# ---- Chunk 5 ----
#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length))+geom_boxplot()


# ---- Chunk 6 ----
#| echo: true

ggplot(iris,aes(x=Species, y=Petal.Length))+geom_boxplot()


# ---- Chunk 7 ----
ggplot(iris, aes(x=Species,y=Sepal.Width, fill=Species))+geom_violin()


# ---- Chunk 8 ----

ggplot(iris,aes(x=Sepal.Width))+geom_histogram(bins=10, color="black", fill="white")+labs(y="Frequência", x="Largura de Sépala")

ggplot(iris,aes(x=Sepal.Width))+geom_histogram(bins=11, color="black", fill="white")+labs(y="Frequência", x="Largura de Sépala")+scale_x_continuous(n.breaks = 11)


# ---- Chunk 9 ----

ggplot(iris,aes(x=Sepal.Width))+geom_freqpoly(bins=11, color="black")+labs(y="Frequência", x="Largura de Sépala")+scale_x_continuous(n.breaks = 11)


# ---- Chunk 10 ----
ggplot(iris,aes(x=Sepal.Width))+labs(y="Frequência", x="Largura de Sépala")+scale_x_continuous(n.breaks = 11)+geom_histogram(bins=11, color="black", fill="white")+geom_freqpoly(bins=11, color="blue")

# ---- Chunk 11 ----
ggplot(iris,aes(x=Sepal.Width))+labs(y="Frequência", x="Largura de Sépala")+scale_x_continuous(n.breaks = 11)+geom_histogram(bins=11, color="black", fill="white")+geom_freqpoly(bins=11, color="blue")+facet_grid(~Species)

ggplot(iris,aes(x=Sepal.Width))+labs(y="Frequência", x="Largura de Sépala")+scale_x_continuous(n.breaks = 11)+geom_histogram(bins=11, color="black", fill="white")+geom_freqpoly(bins=11, color="blue")+facet_grid(Species~.)


# ---- Chunk 12 ----
ggplot(iris,aes(x=Sepal.Width))+geom_density(color="black", fill="white")+labs(y="Frequência", x="Largura de Sépala")



# ---- Chunk 13 ----

iris%>%ggplot(aes(x=Species))+geom_bar()


# ---- Chunk 14 ----
iris%>%group_by(Species)%>%summarise(count=n())%>%ggplot(aes(x=Species, fill=Species, y=count))+geom_col(color="black")

# ---- Chunk 15 ----
iris%>%group_by(Species)%>%summarise(count=n()/150*100)%>%ggplot(aes(x=" ", fill=Species, y=count))+geom_col(color="black")+coord_polar(theta="y")+theme_void()

iris%>%group_by(Species)%>%summarise(count=round(n()/150*100, 2))%>%ggplot(aes(x=" ", fill=Species, y=count))+geom_col(color="black")+coord_polar(theta="y")+ geom_label(aes(label = count),
             position = position_stack(vjust = 0.5),
             show.legend = FALSE)+theme_void()


# ---- Chunk 16 ----
ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width))+geom_point()

# ---- Chunk 17 ----
ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species))+geom_point()

# ---- Chunk 18 ----

ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species))+geom_point()+geom_smooth(se=FALSE, method="lm")


# ---- Chunk 19 ----

ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species))+geom_point()+geom_smooth(se=FALSE, method="lm")+coord_flip()


# ---- Chunk 20 ----

iris%>%group_by(Species)%>%summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%ggplot(aes(x=Species, y=mean))+geom_col()+geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd), width=0.5)+labs(y="Comprimento da Sepala", x="Espécies")+theme_bw()+scale_y_continuous(limits=c(0,10))


# ---- Chunk 21 ----
iris%>%group_by(Species)%>%summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%ggplot(aes(x=Species, y=mean))+geom_col()+geom_linerange(aes(ymin=mean-sd,ymax=mean+sd))+labs(y="Comprimento da Sepala", x="Espécies")+theme_bw()+scale_y_continuous(limits=c(0,10))

# ---- Chunk 22 ----
iris%>%group_by(Species)%>%summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%ggplot(aes(x=Species, y=mean))+geom_col()+geom_pointrange(aes(ymin=mean-sd,ymax=mean+sd))+labs(y="Comprimento da Sepala", x="Espécies")+theme_bw()+scale_y_continuous(limits=c(0,10))

# ---- Chunk 23 ----
iris%>%group_by(Species)%>%summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%ggplot(aes(x=Species, y=mean))+geom_linerange(aes(ymin=mean-sd,ymax=mean+sd))+labs(y="Comprimento da Sepala", x="Espécies")+theme_bw()+scale_y_continuous(limits=c(0,10))

# ---- Chunk 24 ----

iris%>%group_by(Species)%>%summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%ggplot(aes(x=Species, y=mean))+geom_col()+geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd), width=0.5)+labs(y="Comprimento da Sepala", x="Espécies")+theme_bw()+scale_y_continuous(limits=c(0,10))

#exemplo com a escala maior
iris%>%group_by(Species)%>%summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%ggplot(aes(x=Species, y=mean))+geom_col()+geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd), width=0.5)+labs(y="Comprimento da Sepala", x="Espécies")+theme_bw()+scale_y_continuous(limits=c(0,20))



# ---- Chunk 25 ----
Escolaridade<-c(rep("Graduação", 42), rep("Médio", 30), rep("Fundamental", 20))
Escolaridade<-as.data.frame(Escolaridade)

Escolaridade%>%ggplot(aes(x=Escolaridade))+geom_bar()+labs(y="Frequência", x="Escolaridade")

# ---- Chunk 26 ----

Escolaridade%>%mutate(Escolaridade=fct_relevel(Escolaridade,"Fundamental","Médio", "Graduação"))%>%ggplot(aes(x=Escolaridade))+geom_bar()+labs(y="Frequência", x="Escolaridade")

# ---- Chunk 27 ----
#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()


# ---- Chunk 28 ----
#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length))+geom_boxplot(fill=c("lightpink","lightgreen","lightblue"))


# ---- Chunk 29 ----
#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+scale_fill_manual(values=c("#704c41","#41704f","#584170"))


# ---- Chunk 30 ----
#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="brown")


# ---- Chunk 31 ----

#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="brown")+labs(y="Comprimento de pétala", x="Espécies", title="Comparação de comprimento de pétalas", subtitle = "Banco de dados iris")


# ---- Chunk 32 ----
#| output: false
# Instalando o pacote extrafont
install.packages("extrafont")

#Carregando o pacote extrafont
library(extrafont)

#Carregando as fontes presentes no computador
loadfonts(device="all")

# ---- Chunk 33 ----
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies")+theme(text = element_text(face="bold", family="serif"))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies")+theme(text = element_text(face = "bold.italic", family="mono", size=16))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies")+theme(text = element_text(face="italic"))

# ---- Chunk 34 ----
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies")+theme(axis.text.x = element_text(face="italic"))

# ---- Chunk 35 ----
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"))

# ---- Chunk 36 ----
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "none")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "top")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "bottom")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "left", legend.text = element_text(face="italic"))

# ---- Chunk 37 ----
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "left", legend.text = element_text(face="italic"))+ geom_text(x = 2.5, y = 4, label = "Ponto importante", color = "red", face="bold")

# ---- Chunk 38 ----
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "left", legend.text = element_text(face="italic"))+ geom_text(x = 2.5, y = 4, label = "Ponto importante", color = "red")+ annotate("vline", x = 2, xintercept = 2, linetype = "dashed", color = "blue")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot()+labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "left", legend.text = element_text(face="italic"))+ geom_text(x = 2.5, y = 4, label = "Ponto importante", color = "red")+annotate("text", x = 1, y = 3.5, label = "outro ponto", color = "blue")



# ---- Chunk 39 ----
#| echo: true
#| fig-width: 9
#| fig-height: 12.5


default<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Default")

classic<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Classic")+theme_classic()

dark<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Dark")+theme_dark()

bw<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="bw")+theme_bw()

minimal<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Minimal")+theme_minimal()

gray<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Gray")+theme_gray()

light<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Light")+theme_light()

linedraw<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Linedraw")+theme_linedraw()

void<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Void")+theme_void()

default+classic+dark+bw+minimal+gray+light+linedraw+void


# ---- Chunk 40 ----
#Criando ggplots
barra<-Escolaridade%>%mutate(Escolaridade=fct_relevel(Escolaridade,"Fundamental","Médio", "Graduação"))%>%ggplot(aes(x=Escolaridade))+geom_bar()+labs(y="Frequência", x="Escolaridade")
polígono<-iris%>%ggplot(aes(x=Sepal.Length))+geom_freqpoly()+labs(y="Frequência",x="Comprimento de Sépala")
boxplot<-iris%>%ggplot(aes(y=Sepal.Length, x=Species))+geom_boxplot()+labs(y="Comprimento de Sépala", x="Espécies")
pontos<-iris%>%ggplot(aes(x=Sepal.Length,y=Sepal.Width, color=Species))+geom_point()+labs(x="Comprimento de Sépala", y="Largura de Sépala", color="Espécies")

barra + polígono + boxplot + pontos



# ---- Chunk 41 ----

(barra + polígono + boxplot)/ pontos


# ---- Chunk 42 ----
#| echo: true
#| message: false
#| warning: false
#| output: false
#instalando o pacote raster e sf
install.packages("raster")
install.packages("sf")

#carregando o pacote raster e sf
library(raster)
library(sf)

# ---- Chunk 43 ----
#| warning: false

# Importando dados
prec<-raster("pelprec.tiff")

pel<-read_sf("Pelotas/Pelotas.shp")

# Convertendo raster para data frame para o ggplot processar o dado
prec_df<-as.data.frame(prec, xy = TRUE, na.rm = TRUE)

head(prec_df)

# ---- Chunk 44 ----
ggplot(prec_df,aes(x=x,y=y,fill=pelprec))+geom_raster()

# ---- Chunk 45 ----
# Cores padrão
ggplot()+geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000", y="Latitude", x="Longitude", fill="Precipitação (mm)")+theme_bw()

ggplot()+geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000", y="Latitude", x="Longitude", fill="Precipitação (mm)")+theme_bw()+scale_fill_gradient(low="gray",high="blue")

ggplot()+geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000", y="Latitude", x="Longitude", fill="Precipitação (mm)")+theme_bw()+scale_fill_gradientn(colours = terrain.colors(10))

# ---- Chunk 46 ----
#| echo: true
#| output: false

#intalando pacote viridis
install.packages("viridis")
#carregando pacote viridis
library(viridis)

# ---- Chunk 47 ----
ggplot()+geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000", y="Latitude", x="Longitude", fill="Precipitação (mm)")+theme_bw()+scale_fill_viridis()



# ---- Chunk 48 ----
#| echo: true
#| output: false
install.packages("remotes")
remotes::install_github("MatthewBJane/ThemePark")
library(ThemePark)

# ---- Chunk 49 ----

#| echo: true

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(lordoftherings_theme_colors["light"],lordoftherings_theme_colors["medium"],lordoftherings_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Senhor dos Anéis")+theme_lordoftherings()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(barbie_theme_colors["light"],barbie_theme_colors["medium"],barbie_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Barbie")+theme_barbie()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(zelda_theme_colors["light"],zelda_theme_colors["medium"],zelda_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Zelda")+theme_zelda()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(simpsons_theme_colors["light"],simpsons_theme_colors["medium"],simpsons_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Simpsons")+theme_simpsons()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(asteroid_city_theme_colors["light"],asteroid_city_theme_colors["medium"],asteroid_city_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Asteroid city")+theme_asteroid_city()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(elf_theme_colors["light"],elf_theme_colors["medium"],elf_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Elf")+theme_elf()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(friends_theme_colors["light"],friends_theme_colors["medium"],friends_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Friends")+theme_friends()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(alien_theme_colors["light"],alien_theme_colors["medium"],alien_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Alien")+theme_alien()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(starwars_theme_colors["light"],starwars_theme_colors["medium"],starwars_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema Star wars")+theme_starwars()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(snes_theme_colors["light"],snes_theme_colors["medium"],snes_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema SNES")+theme_snes()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c(french_dispatch_theme_colors["light"],french_dispatch_theme_colors["medium"],french_dispatch_theme_colors["dark"]))+labs(y="Comprimento de pétala", x="Espécies", title= "Tema French Dispatch")+theme_french_dispatch()


# ---- Chunk 50 ----
#| echo: true
#| message: false
#| warning: false
#| output: false
#instalando plotly
install.packages("plotly")
#carregando plotly
library(plotly)

# ---- Chunk 51 ----
#| warning: false
default<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+labs(y="Comprimento de pétala", x="Espécies", title="Default")

ggplotly(default)

snes1<-ggplot()+geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000", y="Latitude", x="Longitude", fill="Precipitação (mm)")+theme_bw()+scale_fill_snes_b()

ggplotly(snes1)


# ---- Chunk 52 ----
#| echo: true
#| message: false
#| warning: false
#| output: false
#instalando pacotes: gganimate,gapminder,gifski, av e magick
install.packages("gganimate")
install.packages("gapminder")
install.packages("gifski")
install.packages("av")
install.packages("magick")

#carregand os pacotes gganimate, gapminder, av, gifski e magick
library(gganimate)
library(gapminder)
library(av)
library(gifski)
library(magick)

# ---- Chunk 53 ----

data("gapminder")

head(gapminder)

# ---- Chunk 54 ----
ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,color=country,size=pop))+geom_point(alpha=.7, show.legend = FALSE)+scale_colour_manual(values=country_colors)+facet_wrap(~continent)+scale_size(range=c(2,12))+scale_x_log10() + labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')+theme_light()


