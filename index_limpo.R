options(repos = c(CRAN = "https://cloud.r-project.org"))
#instalando pacote ggplot2
install.packages("ggplot2")
#instalando dplyr, forcats e patchwork
install.packages("dplyr")
install.packages("forcats")
install.packages("patchwork")


#Carregando o pacote ggplot2
library(ggplot2)
#Carregando dplyr, forcats e patchwork
library(dplyr)
library(forcats)
library(patchwork)


# Carregando o primeiro banco de dados
data(iris)
head(iris)

# Gerando ggplot

## Boxplot
iris%>%ggplot(aes(x=Species, y=Petal.Length))+
  geom_boxplot()

ggplot(iris,aes(x=Species, y=Petal.Length))+
  geom_boxplot()

## Violin
ggplot(iris, aes(x=Species,y=Sepal.Width, fill=Species))+geom_violin()

##Histograma
ggplot(iris,aes(x=Sepal.Width))+
  geom_histogram(bins=10, color="black", fill="white")+
  labs(y="Frequência", x="Largura de Sépala")

ggplot(iris,aes(x=Sepal.Width))+
  geom_histogram(bins=11, color="black", fill="white")+
  labs(y="Frequência", x="Largura de Sépala")+
  scale_x_continuous(n.breaks = 11)

## Polígono de Frequência
ggplot(iris,aes(x=Sepal.Width))+
  geom_freqpoly(bins=11, color="black")+
  labs(y="Frequência", x="Largura de Sépala")+
  scale_x_continuous(n.breaks = 11)

ggplot(iris,aes(x=Sepal.Width))+
  labs(y="Frequência", x="Largura de Sépala")+
  scale_x_continuous(n.breaks = 11)+
  geom_histogram(bins=11, color="black", fill="white")+
  geom_freqpoly(bins=11, color="blue")

ggplot(iris,aes(x=Sepal.Width))+
  labs(y="Frequência", x="Largura de Sépala")+
  scale_x_continuous(n.breaks = 11)+
  geom_histogram(bins=11, color="black", fill="white")+
  geom_freqpoly(bins=11, color="blue")+
  facet_grid(~Species)

ggplot(iris,aes(x=Sepal.Width))+
  labs(y="Frequência", x="Largura de Sépala")+
  scale_x_continuous(n.breaks = 11)+
  geom_histogram(bins=11, color="black", fill="white")+
  geom_freqpoly(bins=11, color="blue")+
  facet_grid(Species~.)

## Gráfico densidade
ggplot(iris,aes(x=Sepal.Width))+
  geom_density(color="black", fill="white")+
  labs(y="Frequência", x="Largura de Sépala")

## Gráfico de barras
iris%>%ggplot(aes(x=Species))+
  geom_bar()

iris%>%group_by(Species)%>%
  summarise(count=n())%>%
  ggplot(aes(x=Species, fill=Species, y=count))+
  geom_col(color="black")

## Gráfico de setores
iris%>%group_by(Species)%>%
  summarise(count=n()/150*100)%>%
  ggplot(aes(x=" ", fill=Species, y=count))+
  geom_col(color="black")+coord_polar(theta="y")+
  theme_void()

iris%>%group_by(Species)%>%
  summarise(count=round(n()/150*100, 2))%>%
  ggplot(aes(x=" ", fill=Species, y=count))+
  geom_col(color="black")+coord_polar(theta="y")+ 
  geom_label(aes(label = paste0(count, "%")),
             position = position_stack(vjust = 0.5),
             show.legend = FALSE, size=3)+
  theme_void()

## Diagrama de pontos
ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()

ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species))+
  geom_point()

ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species))+
  geom_point()+
  geom_smooth(se=FALSE, method="lm")

ggplot(iris,aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species))+
  geom_point()+
  geom_smooth(se=FALSE, method="lm")+
  coord_flip()

## Média com desvio
iris%>%group_by(Species)%>%
  summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%
  ggplot(aes(x=Species, y=mean))+
  geom_col()+
  geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd), width=0.5)+
  labs(y="Comprimento da Sepala", x="Espécies")+
  theme_bw()+
  scale_y_continuous(limits=c(0,10))

iris%>%group_by(Species)%>%
  summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%
  ggplot(aes(x=Species, y=mean))+
  geom_col()+
  geom_linerange(aes(ymin=mean-sd,ymax=mean+sd))+
  labs(y="Comprimento da Sepala", x="Espécies")+
  theme_bw()+
  scale_y_continuous(limits=c(0,10))

iris%>%group_by(Species)%>%
  summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%
  ggplot(aes(x=Species, y=mean))+
  geom_col()+
  geom_pointrange(aes(ymin=mean-sd,ymax=mean+sd))+
  labs(y="Comprimento da Sepala", x="Espécies")+
  theme_bw()+
  scale_y_continuous(limits=c(0,10))

iris%>%group_by(Species)%>%
  summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%
  ggplot(aes(x=Species, y=mean))+
  geom_linerange(aes(ymin=mean-sd,ymax=mean+sd))+
  labs(y="Comprimento da Sepala", x="Espécies")+
  theme_bw()+
  scale_y_continuous(limits=c(0,10))

iris%>%group_by(Species)%>%
  summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%
  ggplot(aes(x=Species, y=mean))+
  geom_col()+
  geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd), width=0.5)+
  labs(y="Comprimento da Sepala", x="Espécies")+
  theme_bw()+
  scale_y_continuous(limits=c(0,10))

#exemplo com a escala maior
iris%>%group_by(Species)%>%
  summarise(mean=mean(Sepal.Length), sd=sd(Sepal.Length),se=sd(Sepal.Length)/sqrt(length(Sepal.Length)))%>%
  ggplot(aes(x=Species, y=mean))+
  geom_col()+
  geom_errorbar(aes(ymin=mean-sd,ymax=mean+sd), width=0.5)+labs(y="Comprimento da Sepala", x="Espécies")+
  theme_bw()+
  scale_y_continuous(limits=c(0,20))

## Ordenando eixo
Escolaridade<-c(rep("Graduação", 42), rep("Médio", 30), rep("Fundamental", 20))
Escolaridade<-as.data.frame(Escolaridade)

Escolaridade%>%ggplot(aes(x=Escolaridade))+
  geom_bar()+
  labs(y="Frequência", x="Escolaridade")

Escolaridade%>%mutate(Escolaridade=fct_relevel(Escolaridade,"Fundamental","Médio", "Graduação"))%>%
  ggplot(aes(x=Escolaridade))+
  geom_bar()+
  labs(y="Frequência", x="Escolaridade")

##Mudando cores
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()

iris%>%ggplot(aes(x=Species, y=Petal.Length))+
  geom_boxplot(fill=c("lightpink","lightgreen","lightblue"))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  scale_fill_manual(values=c("#704c41","#41704f","#584170"))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="brown")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="brown")+
  labs(y="Comprimento de pétala", x="Espécies", title="Comparação de comprimento de pétalas", subtitle = "Banco de dados iris")

## Mudando fontes
# Instalando o pacote extrafont
install.packages("extrafont")
#Carregando o pacote extrafont
library(extrafont)
#Carregando as fontes presentes no computador
loadfonts(device="all")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies")+
  theme(text = element_text(face="bold", family="serif"))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies")+
  theme(text = element_text(face = "bold.italic", family="mono", size=16))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies")+
  theme(text = element_text(face="italic"))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies")+
  theme(axis.text.x = element_text(face="italic"))

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"))

## Posição da legenda
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "none")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "top")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), legend.position = "bottom")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"), 
        legend.position = "left", legend.text = element_text(face="italic"))

## Anotações
iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"),
        legend.position = "left", legend.text = element_text(face="italic"))+
  geom_text(x = 2.5, y = 4, label = "Ponto importante", color = "red", face="bold")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"),
        legend.position = "left", legend.text = element_text(face="italic"))+
  geom_text(x = 2.5, y = 4, label = "Ponto importante", color = "red")+
  annotate("vline", x = 2, xintercept = 2, linetype = "dashed", color = "blue")

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(y="Comprimento de pétala", x="Espécies", fill="Espécies", title="Aqui é o título")+
  theme(axis.text.x = element_text(face="italic"), plot.title = element_text(face="bold"),
        legend.position = "left", legend.text = element_text(face="italic"))+
  geom_text(x = 2.5, y = 4, label = "Ponto importante", color = "red")+
  annotate("text", x = 1, y = 3.5, label = "outro ponto", color = "blue")

##Temas do ggplot
default<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Default")

classic<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Classic")+
  theme_classic()

dark<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Dark")+
  theme_dark()

bw<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="bw")+
  theme_bw()

minimal<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Minimal")+
  theme_minimal()

gray<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Gray")+
  theme_gray()

light<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Light")+
  theme_light()

linedraw<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Linedraw")+
  theme_linedraw()

void<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Void")+
  theme_void()

default+classic+dark+bw+minimal+gray+light+linedraw+void

## Como unir varios ggplots em uma imagem
#Criando ggplots
barra<-Escolaridade%>%mutate(Escolaridade=fct_relevel(Escolaridade,"Fundamental","Médio", "Graduação"))%>%
  ggplot(aes(x=Escolaridade))+
  geom_bar()+
  labs(y="Frequência", x="Escolaridade")

polígono<-iris%>%ggplot(aes(x=Sepal.Length))+
  geom_freqpoly()+
  labs(y="Frequência",x="Comprimento de Sépala")

boxplot<-iris%>%ggplot(aes(y=Sepal.Length, x=Species))+
  geom_boxplot()+
  labs(y="Comprimento de Sépala", x="Espécies")

pontos<-iris%>%ggplot(aes(x=Sepal.Length,y=Sepal.Width, color=Species))+
  geom_point()+
  labs(x="Comprimento de Sépala", y="Largura de Sépala", color="Espécies")

barra + polígono + boxplot + pontos

(barra + polígono + boxplot)/ pontos

##Mapa ggplot
#instalando o pacote raster e sf
install.packages("raster")
install.packages("sf")
#carregando o pacote raster e sf
library(raster)
library(sf)

# Importando dados
prec<-raster("pelprec.tiff")
pel<-read_sf("Pelotas/Pelotas.shp")
# Convertendo raster para data frame para o ggplot processar o dado
prec_df<-as.data.frame(prec, xy = TRUE, na.rm = TRUE)
head(prec_df)

ggplot(prec_df,aes(x=x,y=y,fill=pelprec))+
  geom_raster()

## Mudando cores gradiente
ggplot()+
  geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+
  geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+
  labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000",
       y="Latitude", x="Longitude", fill="Precipitação (mm)")+
  theme_bw()

ggplot()+
  geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+
  geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+
  labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000",
       y="Latitude", x="Longitude", fill="Precipitação (mm)")+
  theme_bw()+scale_fill_gradient(low="gray",high="blue")

ggplot()+
  geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+
  geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+
  labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000",
       y="Latitude", x="Longitude", fill="Precipitação (mm)")+
  theme_bw()+
  scale_fill_gradientn(colours = terrain.colors(10))

#intalando pacote viridis
install.packages("viridis")
#carregando pacote viridis
library(viridis)
ggplot()+
  geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+
  geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+
  labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000",
       y="Latitude", x="Longitude", fill="Precipitação (mm)")+
  theme_bw()+
  scale_fill_viridis()

##ThemePark
install.packages("remotes")
remotes::install_github("MatthewBJane/ThemePark")
library(ThemePark)

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(lordoftherings_theme_colors["light"],
                      lordoftherings_theme_colors["medium"],
                      lordoftherings_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Senhor dos Anéis")+
  theme_lordoftherings()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(barbie_theme_colors["light"],
                      barbie_theme_colors["medium"],
                      barbie_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Barbie")+
  theme_barbie()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(zelda_theme_colors["light"],
                      zelda_theme_colors["medium"],
                      zelda_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Zelda")+
  theme_zelda()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(simpsons_theme_colors["light"],
                      simpsons_theme_colors["medium"],
                      simpsons_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Simpsons")+
  theme_simpsons()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(asteroid_city_theme_colors["light"],
                      asteroid_city_theme_colors["medium"],
                      asteroid_city_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Asteroid city")+
  theme_asteroid_city()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(elf_theme_colors["light"],
                      elf_theme_colors["medium"],
                      elf_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Elf")+
  theme_elf()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(friends_theme_colors["light"],
                      friends_theme_colors["medium"],
                      friends_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Friends")+
  theme_friends()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(alien_theme_colors["light"],
                      alien_theme_colors["medium"],
                      alien_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Alien")+
  theme_alien()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(starwars_theme_colors["light"],
                      starwars_theme_colors["medium"],
                      starwars_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema Star wars")+
  theme_starwars()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(snes_theme_colors["light"],
                      snes_theme_colors["medium"],
                      snes_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema SNES")+
  theme_snes()

iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c(french_dispatch_theme_colors["light"],
                      french_dispatch_theme_colors["medium"],
                      french_dispatch_theme_colors["dark"]))+
  labs(y="Comprimento de pétala", x="Espécies", title= "Tema French Dispatch")+
  theme_french_dispatch()

##Gráfico interativo
#instalando plotly
install.packages("plotly")
#carregando plotly
library(plotly)

default<-iris%>%ggplot(aes(x=Species, y=Petal.Length, fill=Species))+
  geom_boxplot(fill=c("lightblue","lightgreen","lightpink"), color="black")+
  labs(y="Comprimento de pétala", x="Espécies", title="Default")

ggplotly(default)

snes1<-ggplot()+geom_raster(data=prec_df,aes(x=x,y=y,fill=pelprec))+
  geom_sf(data=pel,fill=NA, color="gray",linewidth=2, alpha=.01)+
  labs(title="Mapa da média anual da precipitação \n em Pelotas-RS entre 1970-2000",
       y="Latitude", x="Longitude", fill="Precipitação (mm)")+
  theme_bw()+
  scale_fill_snes_b()

ggplotly(snes1)

##Gráfico animado
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

data("gapminder")

head(gapminder)

ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,color=country,size=pop))+
  geom_point(alpha=.7, show.legend = FALSE)+
  scale_colour_manual(values=country_colors)+
  facet_wrap(~continent)+scale_size(range=c(2,12))+scale_x_log10() +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')+theme_light()
